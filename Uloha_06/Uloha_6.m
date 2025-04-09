clc;
clear;
close all;

[y, Fs] = audioread('ovcaci-housle.wav');   % Načtení zvukového souboru


%% -------------------------- Parametry analýzy ---------------------------
velikost = 256;
prekryv = 128;
N = velikost - 1;
frames = 853;

%% -------------------------- Výpočet ZCR hodnot --------------------------
ZCR = zeros(1, frames);     % Inicializace pole pro ZCR hodnoty

for i = 1:frames
    zacatek = (i - 1) * (velikost - prekryv) + 1;   % rámec
    konec = zacatek + N;   
    vzorek = y(zacatek:konec);
    ZCR(i) = 1 / (2 * N) * sum(abs(sign(vzorek(2:end)) - sign(vzorek(1:end-1))));   %vzorec pro ZCR
end

%% ------------------------------VYKRESLOVÁNÍ------------------------------
% -----------------------Vykreslení původního signálu----------------------
subplot(3,1,1);
plot(y);title('Původní signál');
xlabel('Vzorky');

% -----------------------------Vykreslení ZCR------------------------------
subplot(3,1,2);
plot(ZCR);
title('ZCR');
xlabel('Rámce');

% ---------------------------Vykreslení spektrogramu-----------------------
subplot(3,1,3);
spectrogram(y, hamming(velikost), prekryv, velikost, Fs, 'yaxis');     % hamming => přímo fce window
title('Spektrogram');
