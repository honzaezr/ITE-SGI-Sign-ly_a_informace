;%clear all;
% data 
test_soubor = 'c0_p0001_v01.jpg';
tren_soubor = ['c5_p0001_v02.jpg';'c6_p0001_v02.jpg';'c7_p0001_v02.jpg';'c8_p0001_v02.jpg';'c9_p0001_v02.jpg';
               'c0_p0001_v02.jpg';'c1_p0001_v02.jpg';'c2_p0001_v02.jpg';'c3_p0001_v02.jpg';'c4_p0001_v02.jpg'];



% ---------------- vyprinteni obrazku -----------------
C = imread(test_soubor);
image(C)
%-----------------------------------------------------
               
% porovnani vzdalenosti
x = imread(test_soubor);
for j = 1:10
    v = imread(tren_soubor(j, :));
    dist(j) = sum(sum(abs(x - v)));
end

% vyhodnoceni
[min_dist, index] = min(dist);
nejblizsi_trida = tren_trida(index);
disp (['Obrázek rozpoznán jako ', num2str(nejblizsi_trida)])






