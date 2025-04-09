Fs = 8000;
Fc=2000;
N=100;
n =-((N-1)/2):((N-1)/2);

% dp hamming
F = Fc / Fs;N
h = F * sinc(F*n);
x = h.*hamming(N)';
figure(1);
freqz(x, 1, 1024, Fs);


% fir 1
figure(2);
x=fir1(N,F,'low');
freqz(x, 1, 1024, Fs);


% fir 2
figure(3);
    f = [0 0.6 0.6 1];   
    m = [1 1 0 0];
x=fir2(N,f,m);
freqz(x, 1, 1024, Fs);

