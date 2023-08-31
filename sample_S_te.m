function  [oput_par]=sample_S_te(pre_param,oput_par,k)
%% sample factor score via one-vs-all for multiclass svm
   midsigma=1/(sum(oput_par.D(:,k).^2.*oput_par.phi(:))+oput_par.tau(k)+1e-6);
   midmu=(oput_par.D(:,k).*oput_par.phi(:))'*oput_par.res_te;
   midmu=midsigma.*midmu;
   oput_par.S_te(k,:) =midmu+midsigma.^0.5.*randn(1,length(pre_param.teindv));
