clc;
clear all;
close all;

f=2;
Fs=1000;
PocetSlozek=1000;
t=0:(1/Fs):1;
X1=zeros(size(t));
X2=X1;

for n=1:2:PocetSlozek
    X1=X1+cos(2*pi*n*f.*t-(pi/2))./n;
end

subplot(2,1,1);
plot(t,X1);
title('obdélníkový signál');
xlabel('t[sec]');
N=500;
f=0:Fs/N:Fs/2-Fs/N;
X=fft(X1,N);
subplot(2,1,2);
stem(f(1:40),1/(N/2)*abs(X(1:40)),'.');
xlabel('f[Hz]');
f=2;

for n=1:PocetSlozek
    X2=X2+cos(2*pi*n*f.*t-(pi/2))./n;
end

figure;
subplot(2,1,1);
plot(t,X2);
title('pilový signál');
xlabel('t[sec]');
f=0:Fs/N:Fs/2-Fs/N;
X=fft(X2,N);
subplot(2,1,2);
stem(f(1:40),1/(N/2)*abs(X(1:40)),'.');
xlabel('f[Hz]');