% Farinaz Fallahpour

% Date: 2012 

% https://github.com/FarinazFallahpour

%% Feature Extraction 
%% EigenFace
% Defenition
PoseCount=6; 
N=10-PoseCount;
TestCount=PoseCount+1;
TrainNum=PoseCount*40;
TestNum=400-TrainNum;
%% Construct Dataset For Training Data
for i=1:40
    for j=1:PoseCount
    Stri=int2str(i);
    Strj=int2str(j);
    S1=strcat(Address,Stri,'\',Strj,'.tif');
    X=imread(S1);
    Xnew = reshape(X,1,112*92);
   Train(((i-1)*PoseCount+j),:)=Xnew;
   end
end
%% Construct Dataset For Test
for i=1:40
    for j=TestCount:10
    Stri=int2str(i);
    Strj=int2str(j);
    S1=strcat(Address,Stri,'\',Strj,'.tif');
    X=imread(S1);
    Xnew = reshape(X,1,112*92);
   Test((i-1)*N+(rem(j,TestCount)+1),:)=Xnew;
    end
end
%Calculate Mean
Eigen.mean=mean(Train',2)';   
%Normalized From Mean
for i=1:240
    Eigen.train(i,:)=double(Train(i,:))-Eigen.mean;   
end
for i=1:160
    Eigen.test(i,:)=double(Test(i,:))-Eigen.mean;
end
% C=DD'
C=Eigen.train*Eigen.train';
%Claculat Eigenvalue C
[vector value]=eig(C);
%Transfor To New Space (U=VD')
U=vector*Eigen.train;
%Feature Vector(w)
FeatureVecTrain=U*Eigen.train';
FeatureVecTest=U*Eigen.test';