clear;
close all;
clc;


%% ---------------------------- Nacteni signalu ---------------------------------------
[sig, Fs] = audioread("cv04_00.wav");   % nasteni signalu

%% -------------- Pridani několik 0 na konec signalu, aby mel presne 8000 vzorku ------- 
if size(sig,1) < Fs     % kdyz je velikost signalu mensi než 8000 vzorku
    diff = Fs - size(sig,1);    % kolik nul je potreba do 8000 vzroku
    nuly = zeros(diff, 1);      % vytoreni nul
    sig = [sig;nuly];       % pricteni nul k originalnimu signalu
end
%% ------------------------- Navzorkovani signalu --------------------------------------

parts = size(sig,1) / 100;      % nakolik se ma rozvzorkovat

sub = reshape(sig, 100, parts);     % rovzorkovani vstupniho signalu na 100 vzorku

Esub = sum(sub(:,:).^2, 1);      % vypocet kratkodobe energie

%% --------------------------- Vypocet zpetne diference --------------------------------
for i = 2:size(Esub,2)
    y(i) = Esub(i) - Esub(i - 1);
end
%% -------------------------- Vykresleni signálu ---------------------------------------
subplot(3,1,1)      % vykresleni signalu "cv04_00.wav"
plot(sig);
title("Zadaný signál");


subplot(3,1,2)      % vykresleni energie signalu
plot(Esub)
title("Energie signálu");


subplot(3,1,3)      % vykresleni zpetne diference
plot(y)
title("Zpětná diference");





