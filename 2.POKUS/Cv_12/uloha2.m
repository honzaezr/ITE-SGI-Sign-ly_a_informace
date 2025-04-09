clear;
close all;
clc;
% data - 10 obrazku v trenovaci sade a 10 obrazku v testovaci sade 
test_soubor = ['c0_p0003_s01.jpg';'c1_p0003_s01.jpg';'c2_p0003_s01.jpg';'c3_p0003_s01.jpg';'c4_p0003_s01.jpg',
               'c5_p0003_s01.jpg';'c6_p0003_s01.jpg';'c7_p0003_s01.jpg';'c8_p0003_s01.jpg';'c9_p0003_s01.jpg'];
tren_soubor = ['c0_p0003_s09.jpg';'c1_p0003_s09.jpg';'c2_p0003_s09.jpg';'c3_p0003_s09.jpg';'c4_p0003_s09.jpg',
               'c5_p0003_s09.jpg';'c6_p0003_s09.jpg';'c7_p0003_s09.jpg';'c8_p0003_s09.jpg';'c9_p0003_s09.jpg'];

test_trida = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; % zde je cislo tridy = cislice v danem obrazku 
tren_trida = [0,1,2,3,4,5,6,7,8,9];
              
pocet_pokusu = 0;
pocet_spravnych = 0;

% v cyklu nacteme testovaci obrazek 
for i = 1:10
    x = imread(test_soubor(i,:));
    
    % v druhem cyklu nacteme trenovaci obrazky a zmerime vzdalenosti k
    % testovacimu obrazku
    for j = 1:10
        v = imread(tren_soubor(j, :));
        dist(j) = sum(sum(abs(x - v))); % vzdalenost ulozime do vektoru dist
    end
    
    % vyhodnoceni
    [min_dist, index] = min(dist); % zde doplnte funkci, ktera najde minimalni hodnotu ve vektoru dist
    nejblizsi_trida = tren_trida(index);
    disp (['Obrázek ',test_soubor(i,:), ' rozpoznán jako ', num2str(nejblizsi_trida)])
    if test_trida(i) == nejblizsi_trida
       % zde doplnte prikaz, ktery zvysi pocet spravne rozpoznanych obrazku
       ...
    end
    pocet_pokusu = ...
   
end

skore = ...; % zde doplnte matematicky vyraz, ktery vypocte uspesnost v procentech
disp (['Úspìšnost = ', num2str(skore)])