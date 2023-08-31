function [oput_par]=samplesvmDphi(pre_param,oput_par,k)
%%% sample gamma parameters for the dictionary
[P,K]=size(oput_par.D);
aa= pre_param.Dphia+P/2;
bb=pre_param.Dphib+0.5*sum(oput_par.D(:,k).^2);

oput_par.Dphi(k)=gamrnd(aa,1/bb);
