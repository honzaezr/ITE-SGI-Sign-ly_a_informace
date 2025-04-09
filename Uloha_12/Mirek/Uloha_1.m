clear;
clc;

load("C:\Users\honza\Desktop\škola\SaI\Uloha_12\Mirek\digits_tren.mat")
load("C:\Users\honza\Desktop\škola\SaI\Uloha_12\Mirek\digits_test.mat")

test_soubor = 'c6_p0001_v03.jpg';
tren_soubor = ['c0_p0001_v01.jpg';'c1_p0001_v01.jpg';'c2_p0001_v01.jpg';'c3_p0001_v01.jpg';'c4_p0001_v01.jpg';'c5_p0001_v01.jpg';'c6_p0001_v01.jpg';'c7_p0001_v01.jpg';'c8_p0001_v01.jpg';'c9_p0001_v01.jpg';
               'c0_p0001_v02.jpg';'c1_p0001_v02.jpg';'c2_p0001_v02.jpg';'c3_p0001_v02.jpg';'c4_p0001_v02.jpg';'c5_p0001_v02.jpg';'c6_p0001_v02.jpg';'c7_p0001_v02.jpg';'c8_p0001_v02.jpg';'c9_p0001_v02.jpg']; 
tren_trida = [0,1,2,3,4,5,6,7,8,9,0,1,2,3,4,5,6,7,8,9];

% ---------------- vyprinteni test. obrazku -----------------
subplot(2,1,1);
C = imread(test_soubor);
image(C)
%-----------------------------------------------------

% porovnani vzdalenosti
x = imread(test_soubor);
for j = 1:20                            % 20 = jelikož mám 20 prvnků ve tren_trida
    v = imread(tren_soubor(j, :));      % načteni toho obrázku
    dist(j) = sum(sum(abs(x - v)));     %vzorec pro výpočet cesty
end


% ----------------- vyprinteni hodnot cest ------------
disp('----------------------------------------')
for i = 1:length(dist)
    disp([num2str(tren_trida(i)),' ',num2str(dist(i))])
end

disp(['min: ', num2str(min(dist))])
disp('----------------------------------------')
% -----------------------------------------------------

% ----------------- vyhodnoceni nejblišiho obr. -----------------------
[min_dist, index] = min(dist);
nejblizsi_trida = tren_trida(index);
disp (['Obrázek rozpoznán jako ', num2str(nejblizsi_trida)]);

subplot(2,1,2);
image(imread(tren_soubor(index, :)));
% -----------------------------------------------------
