clear all;
close all;
clc;

%% ------------------------- Načtení nahrávek -----------------------------
[music_low, Fs] = audioread('music_low_end.wav');
[music_high, ~] = audioread('music_high_end.wav');
load('h_mic_low_end.mat', 'h');

%% ------- Výpočet amplitudové frekvenční charakteristiky mikrofonu -------
N = 100;
f = linspace(0, Fs/2, N); % Frekvence od 0 do Fs/2
[H, ~] = freqz(h, 1, f, Fs); % Frekvenční odezva
ampl = abs(H); % Amplitudová charakteristika

%% --------------------- Výpočet kompenzačního filtru ---------------------
ampl_FIR = power(ampl, -1); % Opačná charakteristika

%% --------------------- Návrh kompenzačního filtru -----------------------
M = 64; % Počet koeficientů FIR filtru
FIR = fir2(M, f/(Fs/2), ampl_FIR);

filtered_music = filter(FIR, 1, music_low); % Aplikace filtru na signál

%% ------------------------ Zobrazení výsledků ----------------------------
% Amplidutová charakteristika
figure(1);
plot(f, 20*log10(ampl), 'b', 'DisplayName', 'Low-end mikrofon');
hold on;
plot(f, 20*log10(ampl_FIR), 'r', 'DisplayName', 'Kompenzační filtr');
xlabel('Frekvence (Hz)');
ylabel('Amplituda (dB)');
legend;
grid on;
title('Amplitudové charakteristiky');

% Spektogramy
figure(2);
subplot(3, 1, 1);
spectrogram(music_high, 256, [], [], Fs, 'yaxis');
title('High-end mikrofon');
subplot(3, 1, 2);
spectrogram(music_low, 256, [], [], Fs, 'yaxis');
title('Low-end mikrofon');
subplot(3, 1, 3);
spectrogram(filtered_music, 256, [], [], Fs, 'yaxis');
title('Low-end mikrofon s kompenzačním filtrem');

%% ------------------------- Přehrání signálu -----------------------------
sound(music_low, Fs);
pause(5);
sound(music_high, Fs);
pause(5);
sound(filtered_music, Fs);

