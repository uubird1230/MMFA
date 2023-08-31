function exe_fasvm(XX,Y,pre_param,name)
MM = 1;   %% 试验次数
pre_param.L = 1;
FABSVM.C = [.1 1 10];
FABSVM.col = {'acc','trtime','tetime','avtrtime','avtetime'};
FABSVM.row = pre_param.row;
FABSVM.res = zeros(length(FABSVM.row),length(FABSVM.col),length(FABSVM.C));
FABSVM.res2 = zeros(length(FABSVM.row),MM,length(FABSVM.C));


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
%     disp(i)
end

FABSVM.res2 = zeros(length(FABSVM.row),length(FABSVM.col));
for i = 1:length(FABSVM.row)
    [a,b] = max(FABSVM.res(i,1,:));  
    FABSVM.res2(i,:) = FABSVM.res(i,:,b);
end
disp(FABSVM.res2)
save(name,'FABSVM')