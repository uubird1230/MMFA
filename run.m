load benchmarks.mat;

%-----------------------------------------------------breast_cancer------------------------------

disp('breast_cancer');
data = breast_cancer;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MM=10;
a=1:size(data.x,1);
N=size(data.train,2);
sav=[];
data.name='name';
data.ini_dims=9;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for pp=1:MM;
    big=0;
    %disp(pp);
    pp=pp+1;
    seed=randperm(length(a));
    data.train=a(seed(1:N));
    all=1:max(a);
    for i=1:max(a)
        for j=1:N
            if all(i)==data.train(j)
                all(i)=0;     
            end
        end
    end
    all(find(all==0))=[];
    data.test=all;
    data.x1=data.x(data.train,:);
    data.x2=data.x(data.test,:);
    data.t1=data.t(data.train);
    data.t2=data.t(data.test);
    data.x=[data.x1;data.x2];
    data.t=[data.t1; data.t2];
    data.train=1:N;
    data.test=N+1:max(a);
   
  
    for K=2:1:7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [p1,p2]=main_bek(K,data);
        if p2>=big
            big=p2;
        end
        %fprintf('p=%6.3f\n',p2); 
    end
        %fprintf('Pbig=%6.3f\n',big);
        sav=[sav big];
end

av=mean(sav)*100;
fprintf('av=%6.1f\n',av);
st=std(sav)*100;
fprintf('st=%6.1f\n',st);

%----------------------------------german---------------------------------------------------
disp('german');
data = german;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MM=10;
a=1:size(data.x,1);
N=size(data.train,2);
sav=[];
data.name='name';
data.ini_dims=16;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for pp=1:MM;
    big=0;
    %disp(pp);
    pp=pp+1;
    seed=randperm(length(a));
    data.train=a(seed(1:N));
    all=1:max(a);
    for i=1:max(a)
        for j=1:N
            if all(i)==data.train(j)
                all(i)=0;     
            end
        end
    end
    all(find(all==0))=[];
    data.test=all;
    data.x1=data.x(data.train,:);
    data.x2=data.x(data.test,:);
    data.t1=data.t(data.train);
    data.t2=data.t(data.test);
    data.x=[data.x1;data.x2];
    data.t=[data.t1; data.t2];
    data.train=1:N;
    data.test=N+1:max(a);
   
  
    for K=2:2:14 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [p1,p2]=main_bek(K,data);
        if p2>=big
            big=p2;
        end
        %fprintf('p=%6.3f\n',p2); 
    end
        %fprintf('Pbig=%6.3f\n',big);
        sav=[sav big];
end

av=mean(sav)*100;
fprintf('av=%6.1f\n',av);
st=std(sav)*100;
fprintf('st=%6.1f\n',st);

%----------------------------------heart---------------------------------------------------
disp('heart');
data = heart;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MM=10;
a=1:size(data.x,1);
N=size(data.train,2);
sav=[];
data.name='name';
data.ini_dims=12;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for pp=1:MM;
    big=0;
    %disp(pp);
    pp=pp+1;
    seed=randperm(length(a));
    data.train=a(seed(1:N));
    all=1:max(a);
    for i=1:max(a)
        for j=1:N
            if all(i)==data.train(j)
                all(i)=0;     
            end
        end
    end
    all(find(all==0))=[];
    data.test=all;
    data.x1=data.x(data.train,:);
    data.x2=data.x(data.test,:);
    data.t1=data.t(data.train);
    data.t2=data.t(data.test);
    data.x=[data.x1;data.x2];
    data.t=[data.t1; data.t2];
    data.train=1:N;
    data.test=N+1:max(a);
   
  
    for K=1:2:11 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [p1,p2]=main_bek(K,data);
        if p2>=big
            big=p2;
        end
        %fprintf('p=%6.3f\n',p2); 
    end
        %fprintf('Pbig=%6.3f\n',big);
        sav=[sav big];
end

av=mean(sav)*100;
fprintf('av=%6.1f\n',av);
st=std(sav)*100;
fprintf('st=%6.1f\n',st);

%----------------------------------twonorm---------------------------------------------------
disp('twonorm');
data = twonorm;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MM=10;
a=1:size(data.x,1);
N=size(data.train,2);
sav=[];
data.name='name';
data.ini_dims=15;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for pp=1:MM;
    big=0;
    %disp(pp);
    pp=pp+1;
    seed=randperm(length(a));
    data.train=a(seed(1:N));
    all=1:max(a);
    for i=1:max(a)
        for j=1:N
            if all(i)==data.train(j)
                all(i)=0;     
            end
        end
    end
    all(find(all==0))=[];
    data.test=all;
    data.x1=data.x(data.train,:);
    data.x2=data.x(data.test,:);
    data.t1=data.t(data.train);
    data.t2=data.t(data.test);
    data.x=[data.x1;data.x2];
    data.t=[data.t1; data.t2];
    data.train=1:N;
    data.test=N+1:max(a);
   
  
    for K=1:2:11 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [p1,p2]=main_bek(K,data);
        if p2>=big
            big=p2;
        end
        %fprintf('p=%6.3f\n',p2); 
    end
        %fprintf('Pbig=%6.3f\n',big);
        sav=[sav big];
end

av=mean(sav)*100;
fprintf('av=%6.1f\n',av);
st=std(sav)*100;
fprintf('st=%6.1f\n',st);

%-----------------------------------------waveform--------------------------------
disp('waveform');
data = waveform;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MM=10;
a=1:size(data.x,1);
N=size(data.train,2);
sav=[];
data.name='name';
data.ini_dims=15;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for pp=1:MM;
    big=0;
    %disp(pp);
    pp=pp+1;
    seed=randperm(length(a));
    data.train=a(seed(1:N));
    all=1:max(a);
    for i=1:max(a)
        for j=1:N
            if all(i)==data.train(j)
                all(i)=0;     
            end
        end
    end
    all(find(all==0))=[];
    data.test=all;
    data.x1=data.x(data.train,:);
    data.x2=data.x(data.test,:);
    data.t1=data.t(data.train);
    data.t2=data.t(data.test);
    data.x=[data.x1;data.x2];
    data.t=[data.t1; data.t2];
    data.train=1:N;
    data.test=N+1:max(a);
   
  
    for K=2:2:12 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [p1,p2]=main_bek(K,data);
        if p2>=big
            big=p2;
        end
        %fprintf('p=%6.3f\n',p2); 
    end
        %fprintf('Pbig=%6.3f\n',big);
        sav=[sav big];
end

av=mean(sav)*100;
fprintf('av=%6.1f\n',av);
st=std(sav)*100;
fprintf('st=%6.1f\n',st);

%-----------------------------------------------------diabetis------------------------------
disp('diabetis');
data = diabetis;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MM=10;
a=1:size(data.x,1);
N=size(data.train,2);
sav=[];
data.name='name';
data.ini_dims=7;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for pp=1:MM;
    big=0;
    %disp(pp);
    pp=pp+1;
    seed=randperm(length(a));
    data.train=a(seed(1:N));
    all=1:max(a);
    for i=1:max(a)
        for j=1:N
            if all(i)==data.train(j)
                all(i)=0;     
            end
        end
    end
    all(find(all==0))=[];
    data.test=all;
    data.x1=data.x(data.train,:);
    data.x2=data.x(data.test,:);
    data.t1=data.t(data.train);
    data.t2=data.t(data.test);
    data.x=[data.x1;data.x2];
    data.t=[data.t1; data.t2];
    data.train=1:N;
    data.test=N+1:max(a);
   
  
    for K=2:1:7 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [p1,p2]=main_bek(K,data);
        if p2>=big
            big=p2;
        end
        %fprintf('p=%6.3f\n',p2); 
    end
        %fprintf('Pbig=%6.3f\n',big);
        sav=[sav big];
end

av=mean(sav)*100;
fprintf('av=%6.1f\n',av);
st=std(sav)*100;
fprintf('st=%6.1f\n',st);

%-----------------------------------------------------splice------------------------------
disp('splice');
data =splice;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
MM=10;
a=1:size(data.x,1);
N=size(data.train,2);
sav=[];
data.name='name';
data.ini_dims=22;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for pp=1:MM;
    big=0;
    %disp(pp);
    pp=pp+1;
    seed=randperm(length(a));
    data.train=a(seed(1:N));
    all=1:max(a);
    for i=1:max(a)
        for j=1:N
            if all(i)==data.train(j)
                all(i)=0;     
            end
        end
    end
    all(find(all==0))=[];
    data.test=all;
    data.x1=data.x(data.train,:);
    data.x2=data.x(data.test,:);
    data.t1=data.t(data.train);
    data.t2=data.t(data.test);
    data.x=[data.x1;data.x2];
    data.t=[data.t1; data.t2];
    data.train=1:N;
    data.test=N+1:max(a);
   
  
    for K=2:3:20 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [p1,p2]=main_bek(K,data);
        if p2>=big
            big=p2;
        end
        %fprintf('p=%6.3f\n',p2); 
    end
        %fprintf('Pbig=%6.3f\n',big);
        sav=[sav big];
end

av=mean(sav)*100;
fprintf('av=%6.1f\n',av);
st=std(sav)*100;
fprintf('st=%6.1f\n',st);


%-----------------------------------------------------dna------------------------------
load dna.mat;
disp('dna');

data.train=1:2000;
data.test=2001:3184;
data.x=[train1;train2;train3;test1;test2;test3];
data.t=[ones(length(train1),1);2*ones(length(train2),1);3*ones(length(train3),1);ones(length(test1),1);2*ones(length(test2),1);3*ones(length(test3),1)];


MM=10;
a=1:size(data.x,1);
N=max(data.train);
sav=[];
data.name='name';
data.ini_dims=24;%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


for pp=1:MM;
    big=0;
    %disp(pp);
    pp=pp+1;
    seed=randperm(length(a));
    data.train=a(seed(1:N));
    all=1:max(a);
    for i=1:max(a)
        for j=1:N
            if all(i)==data.train(j)
                all(i)=0;     
            end
        end
    end
    all(find(all==0))=[];
    data.test=all;
    data.x1=data.x(data.train,:);
    data.x2=data.x(data.test,:);
    data.t1=data.t(data.train);
    data.t2=data.t(data.test);
    data.x=[data.x1;data.x2];
    data.t=[data.t1; data.t2];
    data.train=1:N;
    data.test=N+1:max(a);
   
  
    for K=2:4:26 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        [p1,p2]=main_bek(K,data);
        if p2>=big
            big=p2;
        end
        %fprintf('p=%6.3f\n',p2); 
    end
        %fprintf('Pbig=%6.3f\n',big);
        sav=[sav big];
end

av=mean(sav)*100;
fprintf('av=%6.1f\n',av);
st=std(sav)*100;
fprintf('st=%6.1f\n',st);

%-----------------------------------------------------------------------------------------------------
