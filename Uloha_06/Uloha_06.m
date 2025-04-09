close;
clear;
clc;

N = 255;        %protoze voe proto, je to dole v zadani

[sig, Fs] = audioread("ovcaci-housle.wav");     %nacteni zvukove stopy

subplot(3,1,1);
plot(sig)

%------------------vypocet hodnot ZCR------------------------------
for n = 2:N
ZCR = (1/(2*(N-2))) * sum(abs(sign(n))-sign(n-1))
end
%------------------------------------------------------------------

subplot(3,1,2);
plot(ZCR)

%-------------------------okenkova fce-----------------------------
for m = 1:N
w(m) = 1/2 * (1 - cos((2*pi*m)/N))
end
%------------------------------------------------------------------


spt = spectrogram(sig, hamming(256), 128, 256, Fs, 'yaxis');        %spectrogram

subplot(3,1,3);
plot(spt)

