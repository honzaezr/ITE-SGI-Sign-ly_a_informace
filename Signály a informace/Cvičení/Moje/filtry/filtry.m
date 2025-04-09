Fs=8000;
f=1;
t=-1:1/Fs:1;
x=0;

for ff=0:3999
    x=x+cos(2*pi*t*ff);
end;
%průměrovací filtr délky 3
y=filter(ones(3,1)/3,1,x);
a=abs(fft(y))/4000;
subplot(4,1,1);plot(a(1:8000));
%délka 11
y=filter(ones(11,1)/11,11,x);
a=abs(fft(y))/4000;
subplot(4,1,2);plot(a(1:8000));
%diference
y=filter([1 -1],1,x);
a=abs(fft(y))/4000;
subplot(4,1,3);plot(a(1:8000));
 %trojuhelník
y=filter([1,2,1]/4,1,x);
a=abs(fft(y))/4000;
subplot(4,1,4);plot(a(1:8000));
 