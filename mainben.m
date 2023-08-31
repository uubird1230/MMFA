clear;close all;clc;
% load D:\Radar\Project\Bayesian_SVM\Experiment\data3.mat
load  freq3HRRP.mat
dataname=data.name;
X=data.x;
pre_param.trindv=data.train;
pre_param.teindv=data.test;
Y= data.t;
pre_param.trainv=Y(pre_param.trindv);
pre_param.testv=Y(pre_param.teindv);


pre_param.K=25;
pre_param.L=1;
pre_param.C=1;

pre_param.paia=1;pre_param.paib=1;
pre_param.Bpaia=1;pre_param.Bpaib=1;
pre_param.phia=1e+0;pre_param.phib=1e-2;
pre_param.Dphia=1e+0;pre_param.Dphib=1e-1;

pre_param.etasigmaa=1;pre_param.etasigmab=1e-0;
pre_param.tau1a=1e-0;pre_param.tau1b=1e-1;
burnin=800;num=10;space=10;

[oput_par]=supFA_multiSVM(X,pre_param,burnin,num,space,dataname);
save supfa.mat oput_par
figure;
plot([oput_par.trainacc;oput_par.avertrainacc;oput_par.testacc;oput_par.avtestacc].','.')
legend('train','train\_av','test','test\_av')