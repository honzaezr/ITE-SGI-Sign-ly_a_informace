clear all;
close all;
clc;

T = 2;
f1 = 4;
f2 = 2;
A1 = 2;
A2 = 4;

fi1 = pi/3;
fi2 = pi/4;

Fs = 20;


t = 0 : 1/Fs : T - 1/Fs;        %od 0 do T - 1/fs, po kroku 1/Fs


x1 = A1*cos(2*pi*f1*t+fi1);     %první signál
x2 = A2*cos(2*pi*f2*t+fi2);     %druhý signál

x3 = x1 + x2;                   %součet signálů
%---------------- plot ----------------------
subplot(3,1,1)
plot(t,x1)

subplot(3,1,2)
plot(t,x2)

subplot(3,1,3)
plot(t,x3)

%--------------- stem ------------------------
figure

subplot(3,1,1)
stem(t,x1)

subplot(3,1,2)
stem(t,x2)

subplot(3,1,3)
stem(t,x3)
%---------------------------------------------