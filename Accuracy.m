% Farinaz Fallahpour

% Date: 2012 

% https://github.com/FarinazFallahpour

function [Acc]=Accuracy(M,T)
[Row ~]=size(M);
Eq=sum(M==T);
Acc=(Eq*100)/Row;
end