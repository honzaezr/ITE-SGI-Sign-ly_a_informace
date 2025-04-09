clear;
close all;
clc;

Fs = 5400;
T = 1;
t = 0:1/Fs:T-1/Fs;
N = 540;

x=0;
for a = 100:100:2600                % signál složený ze součtu cos.
    x = x + cos(2*pi*a*t);
end

n1 = 10; % J = 10                   % zadané frekvence
n2 = 5; % E = 5

f = 0:Fs/N:Fs-Fs/N;
X = fft(x,N);                       % fft pro 1. graf

%-------------- vyprinteni grafu 1 --------------------------------------
subplot(3,2,1);
y = abs(X)/(N/2);
stem(f(1:N/2),y(1:N/2));
title('Signal x')
xlabel('f');
ylabel('|A|');
%--------------------------------------------------------------------------

A = 1;                              % koeficient A
B = CV11_Vypocet(n1,n2);            % koeficient B
x1 = filter(B,A,x);
X1 = fft(x1,N);                     % fft pro 2. graf

%-------------- vyprinteni grafu 2 ----------------------------------------
subplot(3,2,2);
y1 = abs(X1)/(N/2);
stem(f(1:N/2),y1(1:N/2));
title('Signal y');
xlabel('f');
ylabel('|A|');
%--------------------------------------------------------------------------

%-------------- vyprinteni jednotkové kružnice ---------------------------
subplot(3,2,5);
zplane(roots(B),[0;0;0;0]);
%--------------------------------------------------------------------------

%-------------- vyprinteni grafu 3 a 4 ------------------------------------
[c ~] = freqz(B,A);
subplot(3,2,3);
plot(0:1/512:1-1/512,20*log10(abs(c)));
subplot(3,2,4);
plot(0:1/512:1-1/512,unwrap(angle(c)));
%-----------------------------------------------------------------