clear all;
close all;
clc;

Fs = 16000;
M = 40;

frch_f = [0 1000 2000 3000 4000 5000 6000 7000 8000]/(Fs/2);
frch_v = [1 1 1 0.5 0.01 0.01 0.01 0.5 1];

B = fir2(M,frch_f,frch_v);

figure
freqz(B,1,1024,Fs);

[x, Fs] = audioread("corrupted.wav");

y = filter(B,1,x);

figure
subplot(2,1,1)
spectrogram(x,hamming(256),128,256,Fs,'yaxis')
subplot(2,1,2)
spectrogram(y,hamming(256),128,256,Fs,'yaxis')

% sound(x,Fs)
% pause
% sound(y,Fs)