% SOUCTCOS.M - ukazka souctu kosinusovek tvoricich jednotkovy impuls

%vytvor a zobraz zakladni kosinusovku o periode 2*pi
t=-1:0.01:1;
s=cos(2*pi*t);
plot (t,s)

pause %stiskni klavesu

s=cos(2*pi*t);
for n = 1:10
   s=s+cos(2*pi*t*n);
   %s=s+cos(2*pi*t*n/100); chceme-li snizit frekvenci opakovani pulzu
   echo off
end
echo on

plot (t,s)