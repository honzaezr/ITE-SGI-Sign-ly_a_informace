clear all;
clc;
% data - 10 obrazků v trénovací sadě a 10 obrazků v testovací sadě 
test_soubor = ['c0_p0003_s01.jpg';'c1_p0003_s01.jpg';'c2_p0003_s01.jpg';'c3_p0003_s01.jpg';'c4_p0003_s01.jpg',
               'c5_p0003_s01.jpg';'c6_p0003_s01.jpg';'c7_p0003_s01.jpg';'c8_p0003_s01.jpg';'c9_p0003_s01.jpg'];
tren_soubor = ['c0_p0003_s09.jpg';'c1_p0003_s09.jpg';'c2_p0003_s09.jpg';'c3_p0003_s09.jpg';'c4_p0003_s09.jpg',
               'c5_p0003_s09.jpg';'c6_p0003_s09.jpg';'c7_p0003_s09.jpg';'c8_p0003_s09.jpg';'c9_p0003_s09.jpg'];

test_trida = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]; % zde je číslo třídy = číslice v daném obrázku 
tren_trida = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
              
pocet_pokusu = 0; 
pocet_spravnych = 0;

% v cyklu načteme testovací obrázek 
for i = 1:10
    x = imread(test_soubor(i,:));
    
    % v druhém cyklu načteme trénovací obrázky a změříme vzdálenosti k
    % testovacímu obrázku
    for j = 1:10
        v = imread(tren_soubor(j, :));
        dist(j) = sum(sum(abs(x - v))); % vzdálenost uložíme do vektoru dist
    end
    
    % vyhodnocení
    [min_dist, index] = min(dist); % najde minimální hodnotu ve vektoru dist
    nejblizsi_trida = tren_trida(index);
    disp (['Obrázek ', test_soubor(i,:), ' rozpoznán jako ', num2str(nejblizsi_trida)]);
    if test_trida(i) == nejblizsi_trida
       % zvýšíme počet správně rozpoznaných obrázků
       pocet_spravnych = pocet_spravnych + 1;
    end
    pocet_pokusu = pocet_pokusu + 1;
end

% Výpočet úspěšnosti v procentech
skore = (pocet_spravnych / pocet_pokusu) * 100;
disp(['Úspěšnost = ', num2str(skore), '%']);
