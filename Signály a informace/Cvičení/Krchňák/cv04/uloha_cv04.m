clc
clear all;
close all;

[sig, Fs, NBITS] = wavread('cv04_03.wav');
t=0:1/Fs:(length(sig)-1)/Fs;
subplot(3,1,1);
plot(t,sig);
title('signál');
xlabel('t[sec]');

PocetVzorku=size(sig,1);
PocetCasti=ceil(PocetVzorku/100);
E=zeros(PocetCasti);
for i=1:1:PocetVzorku,
    E(floor((i-1)/100)+1)=E(floor((i-1)/100)+1)+sig(i).^2;
end

subplot(3,1,2);
plot(E);
title('krátkodobá energie');

D=zeros(PocetCasti-1);
for i=2:1:PocetCasti,
    D(i-1)=E(i) - E(i-1);
end

subplot(3,1,3);
plot(D);
title('diference energie (zpìtná)');