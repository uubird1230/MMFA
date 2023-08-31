function  [oput_par]=sampleetasigma(pre_param,oput_par)
%%% sample sigma for the disc coefficients
K=length(oput_par.Z);
aa=pre_param.etasigmaa+0.5*1;
bb=pre_param.etasigmab+0.5*oput_par.eta.^2;

oput_par.etasigm=gamrnd(aa,1./bb);