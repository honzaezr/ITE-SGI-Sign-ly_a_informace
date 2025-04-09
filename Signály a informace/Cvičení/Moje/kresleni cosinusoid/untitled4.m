Fs=20;
A1=2;
A2=4;
T=2;
fi1=pi/3;
fi2=pi/4;
f1=4;
f2=2;
t=0:(1/Fs):2
S01=A1*cos(t*f1*2*pi+fi1);
S02=A1*cos(t*f2*2*pi+fi2);
S03=S01+S02;
subplot 311;stem(t,S01);
subplot 312;stem(t,S02);
subplot 313;stem(t,S03);