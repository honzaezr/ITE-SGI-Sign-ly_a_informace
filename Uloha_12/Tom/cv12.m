%clear all;
% data 

load("C:\Users\honza\Desktop\škola\SaI\Uloha_12\Tom\digits_tren.mat")
load("C:\Users\honza\Desktop\škola\SaI\Uloha_12\Tom\digits_test.mat")


test_soubor = 'c0_p0001_v03.jpg';
test_trida = 7;
tren_soubor = ['c0_p0001_v01.jpg';'c1_p0001_v01.jpg';'c2_p0001_v01.jpg';'c3_p0001_v01.jpg';
    'c4_p0001_v01.jpg';'c5_p0001_v01.jpg';'c6_p0001_v01.jpg';'c7_p0001_v01.jpg';'c8_p0001_v01.jpg';
    'c9_p0001_v01.jpg';'c0_p0001_v02.jpg';'c1_p0001_v02.jpg';'c2_p0001_v02.jpg';
    'c3_p0001_v02.jpg';'c4_p0001_v02.jpg';'c5_p0001_v02.jpg';'c6_p0001_v02.jpg';'c7_p0001_v02.jpg';
    'c8_p0001_v02.jpg';'c9_p0001_v02.jpg';]; %nesmí být přítomen test soubor
tren_trida = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9];

% ---------------- vyprinteni obrazku -----------------
C = imread(test_soubor);
image(C)
%-----------------------------------------------------

% porovnani vzdalenosti
x = imread(test_soubor);
for j = 1:20
    v = imread(tren_soubor(j, :));
    dist(j) = sum(sum(abs(x - v)));
end

%b = imread();
%image(b);

% vyhodnoceni
[min_dist, index] = min(dist);
nejblizsi_trida = tren_trida(index);
disp (['Obrázek rozpoznán jako ', num2str(nejblizsi_trida)]);
if test_trida == nejblizsi_trida % zjisti zda klasifikace je správná
disp ('Klasifikace je správná') % pokud ano, zobraz zprávu
end
