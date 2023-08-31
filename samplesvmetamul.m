function   [oput_par]=samplesvmetamul(pre_param,oput_par,Y,m)
%% sample the coefficients in SVM
if nargin<4
    m=1;
end
[K,N]=size(oput_par.S);
midval=[oput_par.S;ones(1,N)];
midS=midval.*repmat(oput_par.invlamda(:,m)'.^0.5,K+1,1);
G=chol(diag(oput_par.etasigma(:,m))+pre_param.C^2*(midS*midS')+1e-8*eye(K+1));
midS=sum(pre_param.C*midval.*repmat((Y+Y.*oput_par.invlamda(:,m)*pre_param.C*pre_param.L)',K+1,1),2);
oput_par.eta(:,m) = G\(randn(K+1,1)+(G')\(midS));

