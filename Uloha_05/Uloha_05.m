clc;
close all;
clear all;
%% -------------------- Zadané parametry ----------------------------------
Fs = 1000;
N = 1000;   % počet vzorků
f = 2;      % zadaná frekvence
t=0:1/Fs:1;
j = 1;
rect = 0; % nuly
saw = 0;

%% -------------------- Vytvoření průběhů ---------------------------------
for n = 1:N
   rect = rect+((1/j)*cos((2*pi*f*t*j)-(pi/2)));
   saw = saw+((1/n)*cos((2*pi*f*t*n)-(pi/2)));
   j = j+2;
end
%% -------------------- Vykreslení průběhů --------------------------------
subplot(2,2,1);
plot(t,rect);

subplot(2,2,3);
plot(t,saw);

% ----------------- Vykreslení magnitudového spektra ----------------------
F = 0:Fs/N:Fs/2-Fs/N;
X = fft(rect,N);    % Fourierova transformace
subplot(2,2,2);
stem(F(1:40),1/(N/2)*abs(X(1:40)),'.');

Y = fft(saw,N);     % Fourierova transformace
subplot(2,2,4);
stem(F(1:40),1/(N/2)*abs(Y(1:40)),'.');