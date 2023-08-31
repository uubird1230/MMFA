function oput_par = fa_Bsvm(X,pre_param,burnin,num,space)

% pre_param.L=1;
pre_param.paia=1;pre_param.paib=1;
pre_param.Bpaia=1;pre_param.Bpaib=1;
pre_param.phia=1e+0;pre_param.phib=1e-2;
pre_param.Dphia=1e+0;pre_param.Dphib=1e-1;
% pre_param.C=1e+0;
pre_param.etasigmaa=1;pre_param.etasigmab=1e-0;
pre_param.tau1a=1e-0;pre_param.tau1b=1e-1;
if nargin<3
burnin=1000;num=100;space=10;
end
tic
temp = supFA_multiSVM(X,pre_param,burnin,num,space,'11');
oput_par.time = toc ;
oput_par.trtime = temp.trtime; %temp.traintime;
oput_par.tetime = temp.tetime; %temp.testtime;
oput_par.avtrtime = oput_par.trtime/(burnin+num);
oput_par.avtetime = oput_par.tetime/num;
xx = temp.avtestacc(temp.avtestacc>0);
oput_par.acc = xx(end);