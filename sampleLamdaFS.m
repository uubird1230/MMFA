function   [oput_par]=sampleLamdaFS(pre_param,oput_par,Y,m)
%% sample the augumented parameters
if nargin<4
    m=1;
end    
% N=length(Y);
% K=length(oput_par.eta(:,m));
% midmu=1./(pre_param.C*abs(pre_param.L-[oput_par.S(oput_par.Z,pre_param.trindv);ones(1,N)]'*oput_par.eta(oput_par.discdicind).*Y));
midmu=1./(pre_param.C*abs(oput_par.Lres(:,m)));
% oput_par.invlamda=invGauss(midmu,1,N,1);
oput_par.invlamda(:,m) = invnrnd(midmu, 1);