clear all;
close all;
clc;

Fs = 16000;

[x1, Fs] = audioread("music_low_end.wav");
[x2, Fs] = audioread("music_high_end.wav");


load("h_mic_low_end.mat","h");

k = linspace(0,(Fs/2),100)


