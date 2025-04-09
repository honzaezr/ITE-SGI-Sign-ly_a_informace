clear;
close all;
clc;

% načetní signálů
[sig, Fs] = audioread('DOBRYDEN.WAV');
[h, Fs2] = audioread('Reverb2.wav');

% transpozice signálů na řádkový vektor a doplnění nulami
sig = sig';
h = [h' zeros(1, length(sig) - length(h))];

y = my_conv(sig, h);

% poměr hlasitosti původního signálu a ozvěny
a = 1.0;
b = 0.5;

% doplnění nulami pro možnost součtu
sig = [sig zeros(1, length(y) - length(sig))];

% původní signál
sound(sig.*a, Fs);

pause(2);

% mix původního signálu a ozvěny
sound((sig.*a + y.*b)/(a+b), Fs);
%% ------------------------ Zobrazení signálů -----------------------------
subplot(3,1,1);
plot(sig)
title('Původní signál');
subplot(3,1,2);
plot(h)
title('Impulsní odezva');
subplot(3,1,3);
plot(y)
title('Výsledek konvoluce');



%% ------------------------ Funkce konvoluce ------------------------------
function y = my_conv(x,h)
X = [x zeros(1, length(h))];        % aby se ty vektory vyrovnaly
H = [h zeros(1, length(x))];        % aby byly stejne dlouhy
y = zeros(1, length(x)+length(h)-1);    % udela stejne dlouhy jako ty dva predchozi

%------------------------ vlastní konvoluce --------------------------
for n = 1:length(y)
    for k = 1:length(x)
        if (n-k+1 > 0)
            y(n) = y(n) + X(k) * H(n-k+1);
        else
            break;
        end
    end
end
%---------------------------------------------------------------------
end