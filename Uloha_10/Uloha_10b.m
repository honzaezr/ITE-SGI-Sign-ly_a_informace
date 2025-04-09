clc;
clear all;
close all;

[x, Fs] = audioread('DOBRYDEN.WAV');
N = 1024;
f = 0:Fs/N:Fs-Fs/N;



X = fft(x,N);
subplot(5,1,1)
plot(f,abs(X)/N);
title('Magnitudové spektrum signálu x')
xlabel('f');
ylabel('|X(f)|');


% a) průmerovací filtr délky 3
A = 1; 
B = [1 1 1]/3;
x1 = filter(B,A,x);
X1 = fft(x1,N);
subplot(5,1,2);
plot(f,abs(X1)/N);
title('Spektrum signálu x filtrovaného prům. filtrem 3');
xlabel('f');
ylabel('|X(f)|');



% b) průmerovací filtr délky 11
A = 1; 
B = ones(11,1)/11;
x2 = filter(B,A,x);
X2 = fft(x2,N);
subplot(5,1,3);
plot(f,abs(X2)/N);
title('Spektrum signálu x filtrovaného prům. filtrem 11');
xlabel('f');
ylabel('|X(f)|');



% c) diferenciátor: y[n] = x[n] - x[n-1]
A = 1; 
B = [1 -1];
x3 = filter(B,A,x);
X3 = fft(x3,N);
subplot(5,1,4);
plot(f,abs(X3)/N);
title('Spektrum signálu x filtrovaného diferenticátorem');
xlabel('f');
ylabel('|X(f)|');



% d) trojúhelníkový filtr délky 3: y[n] = (x[n] + 2x[n-1] + x[n-2])/4
A = 1; 
B = [1 2 1]/4;
x4 = filter(B,A,x);
X4 = fft(x4,N);
subplot(5,1,5);
plot(f,abs(X4)/N);
title('Spektrum signálu x filtrovaného trojúhelníkovým filtrem');
xlabel('f');
ylabel('|X(f)|');


figure
subplot(5,1,1)
plot(x);
title('Původní signál x')
xlabel('n');
ylabel('x[n]');

subplot(5,1,2)
plot(x1);
title('Signál x filtrovaný prům. filtrem 3')
xlabel('n');
ylabel('x[n]');

subplot(5,1,3)
plot(x2);
title('Signál x filtrovaný prům. filtrem 11')
xlabel('n');
ylabel('x[n]');

subplot(5,1,4)
plot(x3);
title('Signál x filtrovaný diferenciátorem')
xlabel('n');
ylabel('x[n]');

subplot(5,1,5)
plot(x1);
title('Signál x filtrovaný trojúhelníkovým filtrem délky 3')
xlabel('n');
ylabel('x[n]');

sound(x,Fs);
pause(1)
sound(x1,Fs);
pause(1)
sound(x2,Fs);
pause(1)
sound(x3,Fs);
pause(1)
sound(x4,Fs);