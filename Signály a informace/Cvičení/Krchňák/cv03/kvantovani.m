[sig,Fs,NBITS]=wavread('signal.wav');
sound(sig,Fs);

NBITSnew=3; %snizeni rozliseni z NBITS=16 na 5 bitu

%1. prevedeni signalu z rozsahu -1:1 (Matlab) do rozsahu odpovidajímu NBITS
signew = sig .* 2^(NBITS-1);

%2. snizeni rozsahu dle NBITSnew = vydeleni vsech hodnot pomerem
%2^NBITS/2^NBITSnew => vydeleni 2^(NBITS-NBITSnew)
signew = signew ./ 2^(NBITS-NBITSnew); signew = round(signew);

%3. normalizace do urovne -1:1 kvuli prehrani
signew = signew ./ 2^(NBITSnew-1);
sound(signew,Fs);