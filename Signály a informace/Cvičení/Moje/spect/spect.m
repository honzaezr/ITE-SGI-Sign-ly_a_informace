[x,Fs]=audioread('ovcaci-housle.wav');
subplot(3,1,3);[B,f,t]=spectrogram(x,hamming(256),128,256,Fs);imagesc(t,f,20*log10(abs(B))), axis xy, colormap (jet);
N = 256;
f = 0:Fs/N:Fs/2-Fs/N;
X = fft(x,N);
%subplot(4,1,2);
%stem(f,1/(N/2)*abs(X(1:N/2)),'.');
subplot(3,1,1);
plot(x);
Y = buffer(x,256,128);
ZCR=mean(abs(diff(sign(Y))));
subplot(3,1,2);plot(ZCR);

