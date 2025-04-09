clear all;
close all;
clc;

BPM = 120;
f_A = 440;        %ton A = 440Hz
q = 2^(1/12);       %ladění mezi 
Fs = 8000;      %vzorkovací frekvence 8kHz

%--------- Tóny ------------------------
f_G = f_A/q^2;      %ladění tonu od tonu A
f_D = f_A/q^7;
f_E = f_A/q^5;
f_F = f_A/q^4;

%------ Tempo --------------------------
T_ctvrt = 60/BPM;       %délka T
T_pul = 120/BPM;
t_ctvrt = 0:1/Fs:T_ctvrt-1/Fs;      %vzorkovací časy
t_pul = 0:1/Fs:T_pul-1/Fs;

%--------- Noty ------------------------
G_ctvrt = cos(2*pi*f_G*t_ctvrt);
A_ctvrt = cos(2*pi*f_A*t_ctvrt);
D_ctvrt = cos(2*pi*f_D*t_ctvrt);
E_ctvrt = cos(2*pi*f_E*t_ctvrt);
F_ctvrt = cos(2*pi*f_F*t_ctvrt);


G_pul = cos(2*pi*f_G*t_pul);
E_pul = cos(2*pi*f_E*t_pul);
F_pul = cos(2*pi*f_F*t_pul);

pomlka_ctvrt = t_ctvrt;
%---------------------------------------



sig = [G_ctvrt G_ctvrt E_ctvrt pomlka_ctvrt     G_ctvrt G_ctvrt E_ctvrt pomlka_ctvrt    G_ctvrt G_ctvrt A_ctvrt G_ctvrt     G_pul F_pul     F_ctvrt F_ctvrt D_ctvrt pomlka_ctvrt    F_ctvrt F_ctvrt D_ctvrt pomlka_ctvrt    F_ctvrt F_ctvrt G_ctvrt F_ctvrt     F_pul E_pul];


sound(sig, Fs)

