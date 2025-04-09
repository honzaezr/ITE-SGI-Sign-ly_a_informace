clc;
clear all;
close all;

Fs=10;
t=0:1/Fs:(2-1/Fs);

sig1=cos(2*pi*4.*t);
sig2=cos(2*pi*2.5.*t);
sig3=cos(2*pi*12.*t);
sig4=cos(2*pi*7.25.*t);



N=10;

[X1] = MyDFT(sig1,N);
[X3] = MyDFT(sig2,N);
[X5] = MyDFT(sig3,N);
[X7] = MyDFT(sig4,N);

N=20;

[X2] = MyDFT(sig1,N);
[X4] = MyDFT(sig2,N);
[X6] = MyDFT(sig3,N);
[X8] = MyDFT(sig4,N);

figure;

N=10;
f = 0:Fs/N:Fs/2-Fs/N;

subplot(4,2,1);
stem(f(1:5),1/(N/2)*abs(X1(1:5)),'.');
subplot(4,2,3);
stem(f(1:5),1/(N/2)*abs(X3(1:5)),'.');
subplot(4,2,5);
stem(f(1:5),1/(N/2)*abs(X5(1:5)),'.');
subplot(4,2,7);
stem(f(1:5),1/(N/2)*abs(X7(1:5)),'.');

N=20;
f = 0:Fs/N:Fs/2-Fs/N;

subplot(4,2,2);
stem(f(1:10),1/(N/2)*abs(X2(1:10)),'.');
subplot(4,2,4);
stem(f(1:10),1/(N/2)*abs(X4(1:10)),'.');
subplot(4,2,6);
stem(f(1:10),1/(N/2)*abs(X6(1:10)),'.');
subplot(4,2,8);
stem(f(1:10),1/(N/2)*abs(X8(1:10)),'.');

