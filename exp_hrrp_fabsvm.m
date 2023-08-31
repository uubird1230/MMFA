clear;close all;clc;
load ..\freq3HRRP.mat
MM = 1;   %% 试验次数
pre_param.L = 1;
FABSVM.C = [.1 1 10];
FABSVM.col = {'acc','trtime','tetime','avtrtime','avtetime'};
FABSVM.row = [2 5 10 15 20 25 30 35 40];
FABSVM.res = zeros(length(FABSVM.row),length(FABSVM.col),length(FABSVM.C));
FABSVM.res2 = zeros(length(FABSVM.row),MM,length(FABSVM.C));


X = data.x;    %X = X +randn(size(X))*1e-2;
Y = data.t;
XX = [X(:,data.train),X(:,data.test)];
YY = [Y(data.train,1);Y(data.test,1)];
pre_param.trindv = 1:length(data.train);
pre_param.teindv = pre_param.trindv(end)+1 : size(XX,2);
pre_param.trainv = YY(pre_param.trindv);
pre_param.testv = YY(pre_param.teindv);  
for i = 1:length(FABSVM.row)
    pre_param.K = FABSVM.row(i); 
    for tt = 1:length(FABSVM.C);
        pre_param.C = FABSVM.C(tt);
        acc = 0; trtime = 0;tetime = 0; avtrtime = 0; avtetime = 0;
        for j = 1: MM   % MM 次试验    
            oput_par = fa_Bsvm(XX,pre_param);
            trtime = trtime+oput_par.trtime;
            tetime = tetime+oput_par.tetime;
            avtrtime = avtrtime+oput_par.avtrtime;
            avtetime = avtetime+oput_par.avtetime;
            acc = acc+oput_par.acc;
        end  
        FABSVM.res(i,1,tt) = acc/MM;
        FABSVM.res(i,2,tt) = trtime/MM;
        FABSVM.res(i,3,tt) = tetime/MM;
        FABSVM.res(i,4,tt) = avtrtime/MM;   
        FABSVM.res(i,5,tt) = avtetime/MM; 
    end
    disp(i)
end

FABSVM.res2 = zeros(length(FABSVM.row),length(FABSVM.col));
for i = 1:length(FABSVM.row)
    [a,b] = max(FABSVM.res(i,1,:));  
    FABSVM.res2(i,:) = FABSVM.res(i,:,b);
end
save HRRP_FABSVM.mat FABSVM