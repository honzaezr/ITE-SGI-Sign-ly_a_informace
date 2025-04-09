function Out = CV11_Vypocet(n1,n2)


w1 = ((n1*100)/5400)*2*pi;      % výpočet omegy
w2 = ((n2*100)/5400)*2*pi;      % výpočet omegy

f1c = cos(w1) + 1i*sin(w1);     % složkový tvar
f2c = cos(w2) + 1i*sin(w2);     % složkový tvar

syms z;

% přenosové fce
h1 = (z-f1c);
h2 = (z-conj(f1c));     % komplexně sdružené číslo
h3 = (z-f2c);
h4 = (z-conj(f2c));     % komplexně sdružené číslo

H = (h1*h2*h3*h4);
Out = sym2poly(H);




