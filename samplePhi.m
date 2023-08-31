function  [oput_par]=samplePhi(pre_param,oput_par)
%%% sample tau1 for the unsupervised factor score
N=size(oput_par.S,2);
aa=pre_param.phia+0.5*N;
bb=pre_param.phib+0.5*sum(oput_par.res.^2,2);

oput_par.phi=gamrnd(aa,1./bb);