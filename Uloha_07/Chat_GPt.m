% Definice funkce DFT
function X = DFT(x, N)
    X = zeros(1, N);
    for k = 0:N-1
        sum = 0;
        for n = 0:N-1
            sum = sum + x(n + 1) * exp(-1i * 2 * pi * n * k / N);
        end
        X(k + 1) = sum / N;
    end
end

% Hlavní kód
% Parametry signálu
Fs = 10;         % Vzorkovací frekvence (Hz)
T = 2;           % Doba trvání (s)
N1 = 10;         % Rozlišení DFT (pro první případ)
N2 = 20;         % Rozlišení DFT (pro druhý případ)

% Časový vektor
t = 0:1/Fs:T-1/Fs;

% Frekvence signálů
frequencies = [4, 2.5, 12, 7.25];

% Inicializace matic pro ukládání spekter
spectra_N1 = zeros(length(frequencies), N1);
spectra_N2 = zeros(length(frequencies), N2);

for i = 1:length(frequencies)
    % Generování kosinového signálu
    x = cos(2 * pi * frequencies(i) * t);
    
    % Výpočet DFT pro N1 a N2
    X_N1 = DFT(x, N1);
    X_N2 = DFT(x, N2);
    
    % Uložení magnitudového spektra
    spectra_N1(i, :) = abs(X_N1);
    spectra_N2(i, :) = abs(X_N2);
end

% Zobrazení magnitudových spekter
figure;
subplot(2, 1, 1);
stem(0:N1-1, spectra_N1(1, :));
title('Magnitudové spektrum pro f = 4 Hz (N = 10)');
xlabel('Frekvenční složka');
ylabel('Amplituda');
grid on;

subplot(2, 1, 2);
stem(0:N1-1, spectra_N1(2, :));
title('Magnitudové spektrum pro f = 2.5 Hz (N = 10)');
xlabel('Frekvenční složka');
ylabel('Amplituda');
grid on;

figure;
subplot(2, 1, 1);
stem(0:N2-1, spectra_N2(1, :));
title('Magnitudové spektrum pro f = 4 Hz (N = 20)');
xlabel('Frekvenční složka');
ylabel('Amplituda');
grid on;

subplot(2, 1, 2);
stem(0:N2-1, spectra_N2(2, :));
title('Magnitudové spektrum pro f = 2.5 Hz (N = 20)');
xlabel('Frekvenční složka');
ylabel('Amplituda');
grid on;
