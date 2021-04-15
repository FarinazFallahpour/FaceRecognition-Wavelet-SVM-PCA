% Farinaz Fallahpour

% Date: 2012 

% https://github.com/FarinazFallahpour
 %% 2.2 Wavlet
% %Defenition
wave=[];
% TestSample=FeatureVecTest';
X= FeatureVecTrain';
  for i=1:240  
    [Ia1,Ih1,Iv1,Id1] = dwt2(X(i,:),'haar');   
    [Ia2,Ih2,Iv2,Id2] = dwt2(Ia1,'haar'); 
    [Ia3,Ih3,Iv3,Id3] = dwt2(Ia2,'haar'); 
    [Ia4,Ih4,Iv4,Id4] = dwt2(Ia3,'haar');  
    WaveletVec=reshape(Ia4,1,15);
    wave=[wave;WaveletVec];

  end

wavetrain=[];
for i=1:40
    for j=1:PoseCount
   wavetrainL(((i-1)*PoseCount+j),:)=i;
   wavetrain=[wavetrain ;wave(((i-1)*PoseCount+j),:)];
   end
end
wavetest=[];
for i=1:40
    for j=TestCount:10
    wavetestL((i-1)*N+(rem(j,TestCount)+1),:)=i;
     wavetest= [wavetest;wave((i-1)*N+(rem(j,TestCount)+1),:)];
    end
end
Eigwave=dataset(wavetrain,wavetrainL);
EigwaveTest=dataset(wavetest,wavetestL);
%% RBF
% ResultwaveR=svc(Eigwave,PROXM([],'r'));
% waveR=EigwaveTest*ResultwaveR;
% testc(waveR)
%% Polynomial
ResultwaveP=svc(Eigwave,PROXM([],'p',2));
waveP=EigwaveTest*ResultwaveP;
testc(waveP)
%% Linear
% ResultwaveL=svc(Eigwave,PROXM([],'p'));
% waveL=EigwaveTest*ResultwaveL;
% testc(waveL)
