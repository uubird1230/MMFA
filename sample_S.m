function  [oput_par]=sample_S(pre_param,oput_par,Y,k)
%% sample factor score via one-vs-all for multiclass svm
N=size(Y,1);
mideta=repmat(oput_par.eta(k,:),N,1);

midsigma=1./(sum(oput_par.D(:,k).^2.*oput_par.phi(:))+oput_par.tau(k)...
   +pre_param.C^2*sum(oput_par.invlamda.*mideta.^2,2));

midmu=(oput_par.D(:,k).*oput_par.phi(:))'*oput_par.res(:,pre_param.trindv);
midmu=midmu'+sum(pre_param.C*mideta.*(1+pre_param.C*oput_par.invlamda.*oput_par.Lres).*Y,2);
midmu=midsigma.*midmu;
oput_par.S(k,pre_param.trindv) =(midmu+midsigma.^0.5.*randn(N,1))';

% if ~isempty(pre_param.teindv)==1  && iter>burnin
%    midsigma=1/(sum(oput_par.D(:,k).^2.*oput_par.phi(:))+oput_par.tau(k)+1e-6);
%    midmu=(oput_par.D(:,k).*oput_par.phi(:))'*oput_par.res(:,pre_param.teindv);
%    midmu=midsigma.*midmu;
%    oput_par.S(k,pre_param.teindv) =midmu+midsigma.^0.5.*randn(1,length(pre_param.teindv));
% end
