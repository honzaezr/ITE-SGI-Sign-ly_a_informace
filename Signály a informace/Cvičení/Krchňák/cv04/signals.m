clear all
close all
clc

[Y,FS,NBITS]=wavread('cv04_00.wav');
SMP=size(Y,1);
PARTS=ceil(SMP/100);
E=zeros(PARTS);
for i=1:1:SMP,
    E(floor(i/100)+1)=E(floor(i/100)+1)+Y(i).^2;
end
subplot(3,1,1); plot(Y);
subplot(3,1,2); plot(E);
D=zeros(PARTS-1);
for i=2:1:PARTS,
    D(i-1)=E(i) - E(i-1);
end
subplot(3,1,3); plot(D); 