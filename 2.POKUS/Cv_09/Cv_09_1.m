Fs = 8000;
N = 1024; 
frequencies = linspace(0, 0.5, N);


H = 1 + 2*exp(-1j*2*pi*frequencies) + exp(-1j*4*pi*frequencies); 
magnitude = abs(H);             
phase = angle(H);                

frequency_Hz = frequencies * Fs;

figure(1);
subplot(2, 1, 1);
plot(frequency_Hz, 20*log10(magnitude));
title('Magnitude Response');
xlabel('Frequency (Hz)');
ylabel('Magnitude (dB)');

subplot(2, 1, 2);
plot(frequency_Hz, rad2deg(phase));
title('Phase Response');
xlabel('Frequency (Hz)');
ylabel('Phase (degrees)');

b = [1, 2, 1];
a = 1;

figure(2);
freqz(b, a, N, Fs);