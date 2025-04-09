clear all;
close all;

f = 440;
A = 1;
fi = 0;
M = 0;
Fs = 8000;
t = 0 : 1/Fs : 1 - 1/Fs;

sig1 = A*cos(2*pi*f*t+fi)+M;
sig2 = A*cos(3*pi*f*t+fi)+M;

plot(t,sig1)
sound(sig1,Fs*0.5)
sound(sig2,Fs*0.5)