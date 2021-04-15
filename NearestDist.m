% Farinaz Fallahpour

% Date: 2012 

% https://github.com/FarinazFallahpour
% TestSample=wavetest;
% TrainSample= wavetrain ;
TestSample=FeatureVecTest';
TrainSample= FeatureVecTrain';
D = [];
M = [];
for i = 1 : 160
  for j = 1 :240
   D(i,j) = sum(abs(TestSample(i,:)-TrainSample(j,:)));
  end
end
for i=1:160
    for j=1:240
        if (D(i,j)==min(D(i,:)))
            M(i) = j;
            break
        end
    end
end

for i=1:160
% LL(i)=TrainL(M(i));
LL(i)=wavetrainL(M(i));
end
% Acc=Accuracy(LL',TestL);
Acc=Accuracy(LL',wavetestL);

