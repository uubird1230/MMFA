function [oput_par]=sample_D(oput_par,k)
%% sample the dictionary
[P,N]=size(oput_par.res);
midval1=sum(oput_par.S(k,:).^2);

sigma=1./(midval1*oput_par.phi(:)+oput_par.Dphi(k));
mu=sigma.*(oput_par.res.*repmat(oput_par.phi(:),1,N)*oput_par.S(k,:)');
%mu = sigma.*(diag(oput_par.phi(:))*oput_par.res(:,pre_param.trindv)*oput_par.S(k,pre_param.trindv)');

oput_par.D(:,k) = mu +sigma.^0.5.*randn(P,1);
