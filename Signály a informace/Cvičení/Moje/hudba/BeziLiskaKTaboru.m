%Designed by Tomáš Moravec
clear all; close all; echo off; clc %Vycisteni matlabu

Fs = 44100; %Vzorkovaci frekvence
Nota_cela = 1.2; %Cela nota
Nota_pulova = Nota_cela / 2; %Pulova nota = 0.6
Nota_ctvrtova = Nota_cela / 4; %Ctvrtova nota = 0.3
Takt_pulovy = 1/Fs:1/Fs:Nota_pulova; %Pulovy takt - Pomalejsi
Takt_ctvrtovy = 1/Fs:1/Fs:Nota_ctvrtova; %Ctvrtovy takt - Rychlejsi

%Vzorec = A * cos(2 * pi * frekvence tonu * cas noty) = Rovnice cos(x)
cA = cos(2*pi*261.626.*Takt_ctvrtovy); cB = cos(2*pi*261.626.*Takt_pulovy);
eA = cos(2*pi*329.628.*Takt_ctvrtovy); eB = cos(2*pi*329.628.*Takt_pulovy);
gA = cos(2*pi*391.995.*Takt_ctvrtovy); gB = cos(2*pi*391.995.*Takt_pulovy);
dA = cos(2*pi*293.665.*Takt_ctvrtovy); dB = cos(2*pi*293.665.*Takt_pulovy);

    %Tvorba nabezne a sestupne hrany
    Utlum_ctvrtovy = 1:numel(gA);
    Utlum_ctvrtovy(:) = 1;
    Utlum_ctvrtovy(1:1300) = linspace(0,1,1300); %Nabezna hrana
    Utlum_ctvrtovy(11930:13230) = linspace(1,0,1301); %Sestupna hrana

    Utlum_pulovy = 1:numel(eB);
    Utlum_pulovy(:) = 1;
    Utlum_pulovy(1:2600) = linspace(0,1,2600); %Nabezna hrana
    Utlum_pulovy(23860:26460) = linspace(1,0,2601); %Sestupna hrana

%Pridani nabezne a sestupne hrany
cA = cA.* Utlum_ctvrtovy; cB = cB.* Utlum_pulovy;
eA = eA.* Utlum_ctvrtovy; eB = eB.* Utlum_pulovy;
gA = gA.* Utlum_ctvrtovy; gB = gB.* Utlum_pulovy;
dA = dA.* Utlum_ctvrtovy; dB = dB.* Utlum_pulovy;

%Prehani hudby - Noty po sobe jako ve skladbe
sound([cA eA cA eA gB gA gA cA eA cA eA dB dA dA cA eA gA eA dA dA eB cA eA gA eA dA dA cB], Fs)