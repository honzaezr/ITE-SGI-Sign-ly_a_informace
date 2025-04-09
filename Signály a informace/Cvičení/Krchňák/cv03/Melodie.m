clc;
clear all;
close all;

Fs = 44100; % vzorkovací frekvence

% pøiøazení frekvence jednotlivým tónùm
a1 = 440;
g1 = a1/power(2,2/12);
%f1 = a1/power(2,4/12);
e1 = a1/power(2,5/12);
d1 = a1/power(2,7/12);
c1 = a1/power(2,9/12);

% pøiøazení doby trvání
CelaN = 2;
%PulN = CelaN/2;
CtvrtN = CelaN/4;
OsmiN = CelaN/8;
tCela = 0:1/Fs:CelaN;
%tPul = 0:1/Fs:PulN;
tCtvrt = 0:1/Fs:CtvrtN;
tOsmi = 0:1/Fs:OsmiN;

% generace signálù pro jednotlivé tóny
ton1 = sin(2*pi*c1.*tOsmi);
ton2 = sin(2*pi*e1.*tOsmi);
ton3 = sin(2*pi*g1.*tCtvrt);
ton4 = sin(2*pi*g1.*tOsmi);
ton5 = sin(2*pi*d1.*tCtvrt);
ton6 = sin(2*pi*d1.*tOsmi);
ton7 = sin(2*pi*e1.*tCtvrt);
ton8 = sin(2*pi*c1.*tCtvrt);

% generace signálù pro jednotlivé tóny s vyššími harmonickými
% ton1 = sin(2*pi*c1.*tOsmi)+0.5*sin(2*pi*2*c1.*tOsmi)+(1/3)*sin(2*pi*3*c1.*tOsmi)+0.25*sin(2*pi*4*c1.*tOsmi)+(1/5)*sin(2*pi*5*c1.*tOsmi);
% ton2 = sin(2*pi*e1.*tOsmi)+0.5*sin(2*pi*2*e1.*tOsmi)+(1/3)*sin(2*pi*3*e1.*tOsmi)+0.25*sin(2*pi*4*e1.*tOsmi)+(1/5)*sin(2*pi*5*e1.*tOsmi);
% ton3 = sin(2*pi*g1.*tCtvrt)+0.5*sin(2*pi*2*g1.*tCtvrt)+(1/3)*sin(2*pi*3*g1.*tCtvrt)+0.25*sin(2*pi*4*g1.*tCtvrt)+(1/5)*sin(2*pi*5*g1.*tCtvrt);
% ton4 = sin(2*pi*g1.*tOsmi)+0.5*sin(2*pi*2*g1.*tOsmi)+(1/3)*sin(2*pi*3*g1.*tOsmi)+0.25*sin(2*pi*4*g1.*tOsmi)+(1/5)*sin(2*pi*5*g1.*tOsmi);
% ton5 = sin(2*pi*d1.*tCtvrt)+0.5*sin(2*pi*2*d1.*tCtvrt)+(1/3)*sin(2*pi*3*d1.*tCtvrt)+0.25*sin(2*pi*4*d1.*tCtvrt)+(1/5)*sin(2*pi*5*d1.*tCtvrt);
% ton6 = sin(2*pi*d1.*tOsmi)+0.5*sin(2*pi*2*d1.*tOsmi)+(1/3)*sin(2*pi*3*d1.*tOsmi)+0.25*sin(2*pi*4*d1.*tOsmi)+(1/5)*sin(2*pi*5*d1.*tOsmi);
% ton7 = sin(2*pi*e1.*tCtvrt)+0.5*sin(2*pi*2*e1.*tCtvrt)+(1/3)*sin(2*pi*3*e1.*tCtvrt)+0.25*sin(2*pi*4*e1.*tCtvrt)+(1/5)*sin(2*pi*5*e1.*tCtvrt);
% ton8 = sin(2*pi*c1.*tCtvrt)+0.5*sin(2*pi*2*c1.*tCtvrt)+(1/3)*sin(2*pi*3*c1.*tCtvrt)+0.25*sin(2*pi*4*c1.*tCtvrt)+(1/5)*sin(2*pi*5*c1.*tCtvrt);

% aplikace fade-in a fade-out na jednotlivé tóny
FADE_LEN = 0.05;
fade_samples = round(FADE_LEN.*Fs);
fade_scale = linspace(0,1,fade_samples);
ton1(1:fade_samples) = ton1(1:fade_samples).*fade_scale;
ton1(end-fade_samples+1:end) = ton1(end-fade_samples+1:end).*fade_scale(end:-1:1);
ton2(1:fade_samples) = ton2(1:fade_samples).*fade_scale;
ton2(end-fade_samples+1:end) = ton2(end-fade_samples+1:end).*fade_scale(end:-1:1);
ton3(1:fade_samples) = ton3(1:fade_samples).*fade_scale;
ton3(end-fade_samples+1:end) = ton3(end-fade_samples+1:end).*fade_scale(end:-1:1);
ton4(1:fade_samples) = ton4(1:fade_samples).*fade_scale;
ton4(end-fade_samples+1:end) = ton4(end-fade_samples+1:end).*fade_scale(end:-1:1);
ton5(1:fade_samples) = ton5(1:fade_samples).*fade_scale;
ton5(end-fade_samples+1:end) = ton5(end-fade_samples+1:end).*fade_scale(end:-1:1);
ton6(1:fade_samples) = ton6(1:fade_samples).*fade_scale;
ton6(end-fade_samples+1:end) = ton6(end-fade_samples+1:end).*fade_scale(end:-1:1);
ton7(1:fade_samples) = ton7(1:fade_samples).*fade_scale;
ton7(end-fade_samples+1:end) = ton7(end-fade_samples+1:end).*fade_scale(end:-1:1);
ton8(1:fade_samples) = ton8(1:fade_samples).*fade_scale;
ton8(end-fade_samples+1:end) = ton8(end-fade_samples+1:end).*fade_scale(end:-1:1);

% pøehrání dané melodie
sound([ton1,ton2,ton1,ton2,ton3,ton4,ton4,ton1,ton2,ton1,ton2,ton5,ton6,ton6,ton1,...
       ton2,ton4,ton2,ton6,ton6,ton7,ton1,ton2,ton4,ton2,ton6,ton6,ton8],Fs);