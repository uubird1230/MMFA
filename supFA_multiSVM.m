function [oput_par]=supFA_multiSVM(X,pre_param,burnin,num,space,dataname)
%%% learn the supervised factor loading and score
%%% X: PxN, the observed data matrix, each column corresponds a data sample
%%% Y: Nx1, the label vector
%%% pre_param: predefined hyperparameters
%%% pre_param.K: predifined number of
%%% pre_param.L: predefined cost loss
%%% pre_param.C: trade off parameter
%%% Written by Bo Chen, 5.29, 2013
if min(pre_param.trainv) == -1
    pre_param.trainv(pre_param.trainv==-1) = 2;
    pre_param.testv(pre_param.testv==-1) = 2;
    
end

%%% oput_par.lamda:aug
%%Initialize the paramters
randn('state',0); rand('state',0);

[P,XN]=size(X);

X=X-repmat(mean(X(:,pre_param.trindv),2),1,size(X,2));

K=pre_param.K;
Y=pre_param.trainv;

N=length(Y);
M = max(Y);

%% Initialize factor loading and score
[U_1,S_1,V_1] = svd(full(X(:,pre_param.trindv)),'econ');
oput_par.D=zeros(P,K);
if P<=K
    oput_par.D(:,1:P) = U_1*S_1;
else
    oput_par.D =  U_1*S_1;
    oput_par.D = oput_par.D(1:P,1:K);
end
if P<=K
    W = zeros(K,N);
    W(1:P,:) = V_1';
else
    W = V_1';
    W = W(1:K,1:N);
end

oput_par.S=W;
oput_par.S_te = randn(K,XN-N);
% Initialization for precision of additive noise.
oput_par.Dphi=gamrnd(pre_param.Dphia*ones(K,1),1./pre_param.Dphib);
oput_par.phi = gamrnd(pre_param.phia*ones(P,1),1./pre_param.phib*ones(P,1));
% Initialize the SVM parameters
oput_par.eta=randn(K+1,M);

oput_par.tau=gamrnd(pre_param.tau1a*ones(K,1),1./pre_param.tau1b);

oput_par.res=X(:,pre_param.trindv)-oput_par.D*oput_par.S;
oput_par.res_te = X(:,pre_param.teindv)-oput_par.D*oput_par.S_te;
yind = sub2ind([N,M],(1:N)',Y);
bY = -ones(N,M);  % N x M
bY(yind) = 1;
PX=[oput_par.S;ones(1,N)]'*oput_par.eta;
oput_par.Lres=pre_param.L-PX.*bY;
oput_par.invlamda = 1./abs( pre_param.C*oput_par.Lres);
oput_par.etasigma=gamrnd(pre_param.etasigmaa*ones(K+1,M),1/pre_param.etasigmab);

maxit = burnin + num*space;
iter = 0; numcol=0;
oldDW=0;
oput_par.avertrainacc=zeros(1,maxit);
trtime = 0; tetime = 0;
while (iter<maxit)
    tic
    iter = iter + 1;
    oput_par = main_MCMC(pre_param,oput_par,bY,M,N,Y);
    trtime = trtime + toc;
    tic
    if iter>burnin
        oput_par.res_te = X(:,pre_param.teindv)-oput_par.D*oput_par.S_te;
        for k=1:pre_param.K
            oput_par.res_te=oput_par.res_te+oput_par.D(:,k)*oput_par.S_te(k,:);
            %%% sapme testdata
            [oput_par]=sample_S_te(pre_param,oput_par,k);
            oput_par.res_te=oput_par.res_te-oput_par.D(:,k)*oput_par.S_te(k,:);
        end
    end
    tetime = tetime+toc;
    %%%
    S = [oput_par.S oput_par.S_te];
    DW=[S;ones(1,XN)]'*oput_par.eta;
    
    oput_par.mse(iter)=mean(sqrt(sum(oput_par.res.^2,1)));
    oput_par.Lmse(iter)=sum(max(oput_par.Lres,[],2));
    
    [~, ty] = max(DW, [], 2);
    oput_par.trainacc(iter)= mean(ty(pre_param.trindv)==pre_param.trainv);
    oput_par.testacc(iter)=mean(ty(pre_param.teindv)==pre_param.testv);
    
  
    ndx = iter - burnin;
    test = mod(ndx,space);
    oput_par.avtestacc(iter)=0;
    if (ndx>0) && (test==0)
        oldDW=oldDW+DW;
        numcol=numcol+1;
        oput_par.collectD{numcol}=oput_par.D;
        oput_par.collectS{numcol}=oput_par.S;
        oput_par.collecteta{numcol}=oput_par.eta;
        [~, ty] = max(oldDW, [], 2);
        oput_par.avertrainacc(iter)= mean(ty(pre_param.trindv)==pre_param.trainv);
        oput_par.avtestacc(iter)=mean(ty(pre_param.teindv)==pre_param.testv);
    end
    
end
oput_par.trtime = trtime; oput_par.tetime = tetime;
end % end supFA_multiSVM

function oput_par = main_MCMC(pre_param,oput_par,bY,M,N,Y)

% tic
for k=1:pre_param.K
    oput_par.res=oput_par.res+oput_par.D(:,k)*oput_par.S(k,:);
    oput_par.Lres=oput_par.Lres+oput_par.S(k,pre_param.trindv)'*oput_par.eta(k,:).*bY;
    %%% sample factor score
    [oput_par]=sample_S(pre_param,oput_par,bY,k);
    oput_par.res=oput_par.res-oput_par.D(:,k)*oput_par.S(k,:);
    oput_par.Lres=oput_par.Lres-oput_par.S(k,pre_param.trindv)'*oput_par.eta(k,:).*bY;
    [oput_par]=samplesvmDphi(pre_param,oput_par,k);
end
% toc
% tic
for k=1:pre_param.K
    oput_par.res=oput_par.res+oput_par.D(:,k)*oput_par.S(k,:);
    %%% sapme dictionary
    [oput_par]=sample_D(oput_par,k);
    oput_par.res=oput_par.res-oput_par.D(:,k)*oput_par.S(k,:);
    [oput_par]=samplesvmDphi(pre_param,oput_par,k);
end
% toc
%%% sample augumented parameters
for m=1:M
    [oput_par]=sampleLamdaFS(pre_param,oput_par,bY(:,m),m);
    [oput_par]=samplesvmetamul(pre_param,oput_par,bY(:,m),m);
end
PX=[oput_par.S;ones(1,N)]'*oput_par.eta;
oput_par.Lres=pre_param.L-PX.*bY;
[oput_par]=samplesvmetasigma(pre_param,oput_par);
%%% sample gamma parameters
[oput_par]=sampletauS(pre_param,oput_par);
%%% sample precision parameters
[oput_par]=samplePhi(pre_param,oput_par);
end % main MCMC

