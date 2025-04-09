clc;
clear;
close all;

f1 = 4;
f2 = 2.5;
f3 = 12;
f4 = 7.25;

Fs=10;
t = 0:1/Fs:10;
sig1 = cos(2 * pi * f1 * t);
sig2 = cos(2 * pi * f2 * t);
sig3 = cos(2 * pi * f3 * t);
sig4 = cos(2 * pi * f4 * t);
%% ------------------- VYKRESLOVÁNÍ -------------------------------
% -------------------- N = 10 -------------------------------
N1=10;

X=DFT(sig1,N1);
subplot(4,2,1);
stem(0:N1-1, abs(X));

X=DFT(sig2,N1);
subplot(4,2,3);
stem(0:N1-1, abs(X));

X=DFT(sig3,N1);
subplot(4,2,5);
stem(0:N1-1, abs(X));

X=DFT(sig4,N1);
subplot(4,2,7);
stem(0:N1-1, abs(X));

% ------------------ N = 20 --------------------------------
N2=40;

X=DFT(sig1,N2);
subplot(4,2,2);
stem(0:0.5:N2/2-0.5, abs(X));

X=DFT(sig2,N2);
subplot(4,2,4);
stem(0:0.5:N2/2-0.5, abs(X));

X=DFT(sig3,N2);
subplot(4,2,6);
stem(0:0.5:N2/2-0.5, abs(X));

X=DFT(sig4,N2);
subplot(4,2,8);
stem(0:0.5:N2/2-0.5, abs(X));

%% --------------------funkce DFT---------------------------------------
function X = DFT(x, N)
    X = zeros(1, N);        %% udělá 0
    for k = 1:N
        X(k) = 0;
        for n = 1:N
            X(k) = X(k) + (x(n) * exp(((-2*1i*pi*(n-1)*(k-1)))/N));
        end
        X(k) = X(k)/N;
    end
end