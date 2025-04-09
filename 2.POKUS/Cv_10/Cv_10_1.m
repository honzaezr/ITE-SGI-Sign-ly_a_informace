clear all;
close all;
clc;

Fs = 16000;
M = 40;

F = 4000/(Fs/2);
B = fir1(M,F,"low");

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