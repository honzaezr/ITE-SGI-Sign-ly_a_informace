function [ outX ] = MyDFT( inX,N )


m=size(inX);

outX=zeros(N,1);
for k=1:N
    sum=0;
    
   for n=1:N
   sum=sum+inX(n)*exp(-1i*2*pi*(n-1)*k/N);
   end
   outX(k)=1/N*sum;
end
end