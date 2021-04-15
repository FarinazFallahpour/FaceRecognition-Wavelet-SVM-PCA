% Farinaz Fallahpour

% Date: 2012 

% https://github.com/FarinazFallahpour
 %% 2.2 Wavlet
% %Defenition
wave=[];
for i=1:40
    for j=1:10
    Stri=int2str(i);
    Strj=int2str(j);
    S1=strcat(Address,Stri,'\',Strj,'.jpg');
    X=imread(S1);
    [Ia1,Ih1,Iv1,Id1] = dwt2(X,'haar');   % 56*46
    [Ia2,Ih2,Iv2,Id2] = dwt2(Ia1,'haar'); %28*23
    [Ia3,Ih3,Iv3,Id3] = dwt2(Ia2,'haar'); %14*12
    [Ia4,Ih4,Iv4,Id4] = dwt2(Ia3,'haar');  %7*6
    WaveletVec=reshape(Ia4,1,42);
    wave=[wave;WaveletVec];
    end
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
% ResultwaveP=svc(Eigwave,PROXM([],'p',2));
% waveP=EigwaveTest*ResultwaveP;
% testc(waveP)
%% Linear
ResultwaveL=svc(Eigwave,PROXM([],'p'));
waveL=EigwaveTest*ResultwaveL;
testc(waveL)
