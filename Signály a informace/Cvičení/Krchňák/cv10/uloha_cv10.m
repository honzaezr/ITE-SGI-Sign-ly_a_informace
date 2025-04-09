clc;
clear all;
close all;

Fs=8000;
t=0:1/Fs:(1-1/Fs);

SIG = cos(2*pi*0.*t);

for k=1:3999
    SIG = SIG + cos(2*pi*k.*t);
end

plot(t,SIG);
figure;

N=1024;
f=0:Fs/N:Fs/2-Fs/N;

%prumerovaci filtr n=3

B=[1 1 1]/3;
A=1;
sig1=fft(filter(B,A,SIG),N);

subplot(4,1,1);
stem(f,1/(N/2)*abs(sig1(1:N/2)),'.');

%prumerovaci filtr n=11

B=[1 1 1 1 1 1 1 1 1 1 1]/11;
A=1;
sig2=fft(filter(B,A,SIG),N);

subplot(4,1,2);
stem(f,1/(N/2)*abs(sig2(1:N/2)),'.');

%diferenciator y[n] = x[n] - x[n-1]

B=[1 -1];
A=1;
sig3=fft(filter(B,A,SIG),N);

subplot(4,1,3);
stem(f,1/(N/2)*abs(sig3(1:N/2)),'.');

%trojuhelnikovy filtr delky 3

B=[1 2 1];
A=4;
sig4=fft(filter(B,A,SIG),N);

subplot(4,1,4);
stem(f,1/(N/2)*abs(sig4(1:N/2)),'.');
