% Farinaz Fallahpour

% Date: 2012 

% https://github.com/FarinazFallahpour
%% PreProcess 
%  PreProcess Defenition
close all;
clear all;
clc;
Address='C:\';
%% PGM to JPG
for i=1:40
    for j=1:10
    Stri=int2str(i);
    Strj=int2str(j);
    S1=strcat(Address,Stri,'\',Strj,'.pgm');
    Im=imread(S1);
    S2=strcat(Address,Stri,'\',Strj,'.jpg');
    imwrite(Im,S2);
    end
end
%% Histogram Equalization
for i=1:40
    for j=1:10
    Stri=int2str(i);
    Strj=int2str(j);
    S1=strcat(Address,Stri,'\',Strj,'.jpg');
    Im=imread(S1);  
    HE=histeq(Im);
    S2=strcat(Address,Stri,'\',Strj,'.tif');
    imwrite(HE,S2);
    end
end