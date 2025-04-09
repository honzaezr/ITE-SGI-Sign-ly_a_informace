Fs=8000;
t=0:1/Fs:0.25;
t2=0:1/Fs:0.125;

g=cos(2*pi*392*t);
a=cos(2*pi*440*t);
f=cos(2*pi*350*t);
e=cos(2*pi*330*t);
c=cos(2*pi*262*t);
d=cos(2*pi*294*t);
g2=cos(2*pi*392*t2);
a2=cos(2*pi*440*t2);
f2=cos(2*pi*350*t2);
e2=cos(2*pi*330*t2);
c2=cos(2*pi*262*t2);
d2=cos(2*pi*294*t2);

FD2=1:numel(g2);
FD2(:) = 1;
FD2(1:200) = linspace(0,1,200); 
FD2(801:1001) = linspace(1,0,201); 

FD1 = 1:numel(g);
FD1(:) = 1;
FD1(1:400) = linspace(0,1,400); 
FD1(1601:2001) = linspace(1,0,401); 

g=g.*FD1;a=a.*FD1;f=f.*FD1;e=e.*FD1;c=c.*FD1;d=d.*FD1;
g2=g2.*FD2;a2=a2.*FD2;f2=f2.*FD2;e2=e2.*FD2;c2=c2.*FD2;d2=d2.*FD2;

x=[ g2 g2 a2 g2 g2 g2 a2 g2 g2 g2 a2 g2 g2 g2 a2 g2 f2 f2 f2 f2 e2 e2 e d2 d2 g2 g2 c2 c2 c f2 f2 f2 f2 e2 e2 e d2 d2 g2 g2 c2 c2 c g2 g2 a2 g2 g2 g2 a2 g2 g2 g2 a2 g2 g2 g2 a2 a2 f2 f2 f2 f2 e2 e2 e d2 d2 g2 g2 c2 c2 c f2 f2 f2 f2 e2 e2 e d2 d2 g2 g2 c2 c2 c ]
sound(x,Fs);
