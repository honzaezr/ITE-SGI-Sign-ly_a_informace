Fs=10;
T=2;
t=0:1/Fs:T;
c1=cos(2*pi*t*4);subplot(4,3,1);plot(c1);
c11=pp(c1,10);subplot(4,3,2);stem(c11);
c12=pp(c1,20);subplot(4,3,3);stem(c12);

c2=cos(2*pi*t*2.5);subplot(4,3,4);plot(c2);
c21=abs(fft(c2,10));subplot(4,3,5);stem(c21);
c22=pp(c2,20);subplot(4,3,6);stem(c22);

c3=cos(2*pi*t*12);subplot(4,3,7);plot(c3);
c31=pp(c3,10);subplot(4,3,8);stem(c31);
c32=pp(c3,20);subplot(4,3,9);stem(c32);

c4=cos(2*pi*t*7.25);subplot(4,3,10);plot(c4);
c41=pp(c4,10);subplot(4,3,11);stem(c41);
c42=pp(c4,20);subplot(4,3,12);stem(c42);


