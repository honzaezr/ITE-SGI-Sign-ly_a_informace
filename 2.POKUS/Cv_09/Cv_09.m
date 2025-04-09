clear all;
close all;
clc;

%% ----------------------- Vstupní parametry ------------------------------
% Vzorkovací frekvence
Fs = 8000; 
N = 1024;  

f1 = linspace(0, 0.5, N);
f1s= f1 * Fs;

% Koeficienty systému (z diferenční rovnice)
b = [1, 2, 1]; % Koeficienty čitatele
a = 1;       % Koeficienty jmenovatele (FIR filtr)

%% ----------------- Výpočet frekvenční charakteristiky -------------------
H1 = 1 + 2*exp(-1j*2*pi*f1) + exp(-1j*4*pi*f1); 
[H2, w] = freqz(b, a, N, Fs);

%% --------------------- Výpočet amplitudy a fáze -------------------------
amplituda1 = abs(H1); % Amplituda (modul)
faze1 = angle(H1);    % Fáze v radiánech

amplituda2 = abs(H2);
faze2 = angle(H2);

%% ----------------------- Vykreslení výsledků ----------------------------
figure(1);
subplot(2, 1, 1);
plot(f1s, 20 * log10(amplituda1)); % Amplituda v dB
title('Amplitudová charakteristika (První výpočet)');
xlabel('Frekvence (Hz)');
ylabel('Amplituda (dB)');
grid on;

subplot(2, 1, 2);
plot(f1s, rad2deg(faze1)); % Fáze ve stupních
title('Fázová charakteristika (První výpočet)');
xlabel('Frekvence (Hz)');
ylabel('Fáze (stupně)');
grid on;

% Pomocí freqz
figure(2);
subplot(2, 1, 1);
plot(w, 20 * log10(amplituda2)); % Amplituda v dB
title('Amplitudová charakteristika (Pomocí freqz)');
xlabel('Frekvence (Hz)');
ylabel('Amplituda (dB)');
grid on;

subplot(2, 1, 2);
plot(w, rad2deg(faze2)); % Fáze ve stupních
title('Fázová charakteristika (Pomocí freqz)');
xlabel('Frekvence (Hz)');
ylabel('Fáze (stupně)');
grid on;