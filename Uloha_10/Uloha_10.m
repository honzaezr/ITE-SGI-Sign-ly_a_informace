clc;
clear all;
close all;

Fs = 8000;
N = 1024;
T = 1;
t = 0:1/Fs:T-1/Fs;

%-------------- generování signálu z kosinu -> x ----------------

freq_range = 0:1:3999;
x = zeros(size(t));

for freq = freq_range
    x = x + cos(2 * pi * freq * t);
end

%---------------------------------------------------------------

f = 0:Fs/N:Fs-Fs/N;
X = fft(x,N);
plot(f,abs(X)/N);
title('Magnitudové spektrum signálu x')
xlabel('f');
ylabel('|X(f)|');
figure;



% a) průmerovací filtr délky 3
A = 2; 
B = [1 1 1]/3;
x1 = filter(B,A,x);
X1 = fft(x1,N);
subplot(4,2,1);
plot(f,abs(X1)/N);
title('Průměrovací filtr 3');
xlabel('f');
ylabel('|X(f)|');
subplot(4,2,2);
zplane(roots(B),roots(A));

% b) průmerovací filtr délky 11
A = 1; 
B = ones(11,1)/11;
x2 = filter(B,A,x);
X2 = fft(x2,N);
subplot(4,2,3);
plot(f,abs(X2)/N);
title('Průměrovací filtr 11');
xlabel('f');
ylabel('|X(f)|');
subplot(4,2,4);
zplane(roots(B),roots(A));

% c) diferenciátor: y[n] = x[n] - x[n-1]
A = 1; 
B = [1 -1];
x3 = filter(B,A,x);
X3 = fft(x3,N);
subplot(4,2,5);
plot(f,abs(X3)/N);
title('Diferenciátor');
xlabel('f');
ylabel('|X(f)|');
subplot(4,2,6);
zplane(roots(B),roots(A));

% d) trojúhelníkový filtr délky 3: y[n] = (x[n] + 2x[n-1] + x[n-2])/4
A = 1; 
B = [1 2 1]/4;
x4 = filter(B,A,x);
X4 = fft(x4,N);
subplot(4,2,7);
plot(f,abs(X4)/N);
title('Trojúhelníkový filtr');
xlabel('f');
ylabel('|X(f)|');
subplot(4,2,8);
zplane(roots(B),roots(A));