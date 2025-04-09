clear;
close all;
clc;

%% ------------------------- Aplikování filtrů ----------------------------
[sig, Fs] = audioread('noisy_speech.wav');

load("filtrFIR1_2.mat");  % zde se načte předtím uložený vektor koeficientů B
audio_1 = filter(B, 1, sig);% aplikace filtru FIR

load("filtrFIR1_3.mat");  % zde se načte předtím uložený vektor koeficientů B
audio = filter(B, 1, audio_1);% aplikace filtru FIR

%% ------------------- Zobrazení základních informací ---------------------
% disp('Základní informace o nahrávce:');
% fprintf('Vzorkovací frekvence: %d Hz\n', Fs);
% fprintf('Délka signálu: %.2f sekund\n', length(audio) / Fs);

%% ----------------------- Časový průběh signálu --------------------------
t = (0:length(audio)-1) / Fs; % Vytvoření časového vektoru
figure;
subplot(3, 1, 1);
plot(t, audio);
xlabel('Čas [s]');
ylabel('Amplituda');
title('Časový průběh signálu');
grid on;

%% ------------------------ Spektrogram signálu ---------------------------
subplot(3, 1, 2);
spectrogram(audio, hamming(256), 128, 512, Fs, 'yaxis');
title('Spektrogram signálu');
colorbar;

%% ----------------------- Spektrum signálu (FFT) -------------------------
frequencies = linspace(0, Fs/2, floor(length(audio)/2) + 1); % Frekvenční osa
fft_audio = abs(fft(audio)); % FFT signálu
fft_audio = fft_audio(1:length(frequencies)); % Jednostranné spektrum
subplot(3, 1, 3);
plot(frequencies, 20*log10(fft_audio)); % Logaritmická amplituda
xlabel('Frekvence [Hz]');
ylabel('Amplituda [dB]');
title('Spektrum signálu (FFT)');
grid on;

%% -------------------------- Přehrání signálu ----------------------------
sound(audio, Fs);