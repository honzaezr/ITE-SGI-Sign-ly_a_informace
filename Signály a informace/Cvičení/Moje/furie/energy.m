h='D.WAV';
[s ,Fs ,NBITS ]=wavread(h);
l=length(s);
ls=l/100;
ee=[1:ls];
el=length(ee);
e=zeros(1,el);

for x=1:(el-1);
for f=(ee(x)*100):(ee(x+1)*100);
    e(x)=sum(s(f).^2);
    
end
end

dd=(1:el);dd(1)=0;

for x=2:el;
    dd(x)=(e(x)-e(x-1));
end

subplot(3,1,1);plot(s);
subplot(3,1,2);plot(e);
subplot(3,1,3);plot(dd);


