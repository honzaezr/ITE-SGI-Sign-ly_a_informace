clear;
close all;
clc;

% Načtení signálu
[sig, Fs] = audioread('noisy_speech.wav');


load("filtrFIR1.mat");  % zde se načte předtím uložený vektor koeficientů B
%load("filtrLowpass.mat");
y = filter(B, 1, sig);% aplikace filtru FIR

x = filter(B, 1, sig);



% 
% plot(sig);
% sound(sig, Fs); pause(10);

figure
plot(y)
sound(sig, Fs)