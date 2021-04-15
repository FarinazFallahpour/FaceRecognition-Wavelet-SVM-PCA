% Farinaz Fallahpour

% Date: 2012 

% https://github.com/FarinazFallahpour
TrainL =[];
TestL=[];
for i=1:40 
   TrainL=[TrainL ;repmat(i,6,1)];
   TestL=[TestL;repmat(i,N,1)];% Need For Calculate Accuracy
end
%% MultiClass SVM 
Eig=dataset(FeatureVecTrain',TrainL);
EigTest=dataset(FeatureVecTest',TestL);
%% Linear SVM
% ResultL=svc(Eig); 
% wL=EigTest*ResultL;
% testc(wL);
%% Polynomial
ResultP=svc(Eig,PROXM([],'p',2));
wP=EigTest*ResultP;
testc(wP);
%% RBF
% ResultRBF=svc(Eig,PROXM([],'r'));
% wRBF=EigTest*ResultRBF;
% testc(wRBF);
