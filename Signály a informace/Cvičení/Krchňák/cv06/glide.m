% MELODY.M - vygeneruje 12 tonu stupnice
%-------------------------------------------
clear all;
close all;
clc;
% zvol vzorkovaci frekvenci
Fs = 8000;
% saxis ([-40 40]);  % nastavi zvukovou osu

%vygeneruj casovou osu 
t=0:1/Fs:0.2;

tend=1
t1 = 0.2*Fs;
q = 2^(1/12)
f = 440;
for k = 0:60 
   f1 = f * q^k;
   ton = 0.3*sin(2*pi*f1*t(1:t1)) + 0.3*sin(2*q^7*pi*f1*t(1:t1)) + 0.3*sin(2*q^4*pi*f1*t(1:t1));
%   sound (ton);
  % tony ulozime do pole
   tstart=tend;
   tend=tstart+t1-1;
   mel(tstart:tend)=ton;
   echo off
end
echo on
% prehrajeme cele pole 
sound (mel, Fs)

% zobrazime spektrum melodie
[B,f,t] = spectrogram (mel, hamming(256), 128, 256,Fs);
imagesc(t,f,20*log10(abs(B))), axis xy, colormap (jet);
pause
% ton s vibratem (amplitudova modulace)
t=0:1/Fs:10;
t1 = Fs;
ton=0.05*(10+10*cos(2*pi*5*t(1:t1))).*sin(2*pi*f1*t(1:t1));
sound (ton);


