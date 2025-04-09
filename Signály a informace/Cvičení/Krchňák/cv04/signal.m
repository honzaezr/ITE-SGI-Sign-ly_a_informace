close all;
clear all;
clc;

n=-2:1:5;
x=zeros(size(n));
x(3)=1;
subplot(3,1,1); stem(n,x);
y=zeros(size(n));
y(3:8)=1;
subplot(3,1,2); plot(n,y);
z=zeros(size(n));
for i=0:1:5,
    z(i+3)=i;
end
subplot(3,1,3); plot(n,z);
