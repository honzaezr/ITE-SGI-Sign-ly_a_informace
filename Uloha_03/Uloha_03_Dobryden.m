clear all;
close all;
clc;

[sig,Fs]=audioread('DOBRYDEN.WAV');
NBITS = audioinfo('DOBRYDEN.WAV').BitsPerSample;
disp('Pùvodní signál');
sound(sig,Fs);
subplot(5,1,1)
plot(sig);
title('Pùvodní signál')

pause

NBITSnew=5; %snizeni rozliseni z NBITS=8 na 5 bitu

%1. prevedeni signalu z rozsahu -1:1 (Matlab) do rozsahu odpovidajímu NBITS
signew = sig .* 2^(NBITS-1);
subplot(5,1,2)
close all;

plot(signew);
title('8 bitù')
disp('NBITS - 1 protože hodnoty jsou od -1 do 1')
pause
%2. snizeni rozsahu dle NBITSnew = vydeleni vsech hodnot pomerem
%2^NBITS/2^NBITSnew => vydeleni 2^(NBITS-NBITSnew)
signew = signew ./ 2^(NBITS-NBITSnew);

subplot(5,1,3)
close all;
plot(signew);
title('Rozdíl')
pause


signew = round(signew);
subplot(5,1,4)
close all;
plot(signew);
title('Pøekvantování')

pause


%3. normalizace do urovne -1:1 kvuli prehrani
signew = signew ./ 2^(NBITSnew-1);
subplot(5,1,5)
close all;
plot(signew);
title('Normalizace')
sound(signew,Fs);