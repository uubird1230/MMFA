function  [oput_par]=sampletauS(pre_param,oput_par)
%%% sample tau1 for the disc factor score
[P,N]=size(oput_par.S);
aa=pre_param.tau1a+0.5*N;
% bb=pre_param.tau1b+0.5*sum([oput_par.S oput_par.S_te].^2,2);
bb=pre_param.tau1b+0.5*sum(oput_par.S.^2,2);
oput_par.tau=gamrnd(aa,1./bb);

