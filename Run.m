% Farinaz Fallahpour

% Date: 2012 

% https://github.com/FarinazFallahpour
file = 'data.mat';
if(exist(file)==0)
    PreProcess;
    EigenFace;
    EigenSVM;
    Wavelet;
    save();
else
    load(file);
end


