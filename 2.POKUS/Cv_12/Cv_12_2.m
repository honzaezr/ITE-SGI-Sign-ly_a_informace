clear;
close all;
clc;

%% ---------------------------- Načtení dat -------------------------------
datadir = 'C:\Users\honza\Desktop\škola\SaI\2.POKUS\Cv_12';
file_list = dir(fullfile(datadir, '*.jpg'));

% Předem připravené proměnné
tren_soubor = {}; % Trénovací soubory
test_soubor = {};  % Testovací soubory
tren_trida = [];
test_trida = [];

%% ---------------- Rozdělení dat na základě názvu souborů ----------------
for i = 1:length(file_list)
    file_name = file_list(i).name;
    % Extrakce labelu z názvu souboru (první znak 'cX')
    label = str2double(file_name(2));
    % Testovací sada
    if contains(file_name, '_s01') || contains(file_name, '_s02') || contains(file_name, '_s03') || contains(file_name, '_s04')
        test_soubor{end+1} = fullfile(datadir, file_name);
        test_trida(end+1) = label;
    % Trénovací sada
    else
        tren_soubor{end+1} = fullfile(datadir, file_name);
        tren_trida(end+1) = label;
    end
end

%% ---------------------- Klasifikace pomocí vzorů ------------------------
disp('Klasifikace pomocí vzorů...');
pocet_spravnych = 0;
pocet_pokusu = 0;


for i = 1:length(test_soubor)
    x = imread(test_soubor{i});
    x = double(x(:)); 

    min_dist = inf;

    for j = 1:length(tren_soubor)
        v = imread(tren_soubor{j});   
        v = double(v(:));
        dist = sum(abs(x - v));       
%             [min_dist, index] = min(dist); % najde minimální hodnotu ve vektoru dist
%             
%             nejblizsi_trida = tren_trida(index);

        if dist < min_dist
            min_dist = dist;
            nejblizsi_trida = tren_trida(j);
        end
    end
    
    % Porovnání predikce a skutečné hodnoty
    if test_trida(i) == nejblizsi_trida
        pocet_spravnych = pocet_spravnych + 1;
    end
    pocet_pokusu = pocet_pokusu + 1;
end

skore = (pocet_spravnych / pocet_pokusu) * 100;
disp(['Úspěšnost s použitím vzorů: ', num2str(skore), '%']);

disp('------------------------------------------------------------------');

%% -------------------- Klasifikace pomocí centroidů ----------------------
disp('Klasifikace pomocí centroidů...');
% ----------------------- Vytvoření centroidů -----------------------------
unique_labels = unique(tren_trida);
centroids = zeros(length(unique_labels), numel(x));

for k = 1:length(unique_labels)
    % Seřaďte všechny obrázky příslušné třídě
    class_images = tren_soubor(tren_trida == unique_labels(k));
    class_data = [];
    
    for img = 1:length(class_images)
        v = imread(class_images{img});
        v = double(v(:)); % Převedení na vektor
        class_data = [class_data; v'];
    end
    
    % Vypočítejte centroid (průměr)
    centroids(k, :) = mean(class_data, 1);
end

% --------------------- Testování s centroidy -----------------------------
pocet_spravnych = 0;
pocet_pokusu = 0;

for i = 1:length(test_soubor)
    x = imread(test_soubor{i});
    x = double(x(:)); % Převedení na vektor
    
    min_dist = inf;
    nejblizsi_trida = -1;
    
    for k = 1:length(unique_labels)
        % Výpočet L1 vzdálenosti k centroidu
        dist = sum(sum(abs(x - centroids(k, :)')));
        
        if dist < min_dist
            min_dist = dist;
            nejblizsi_trida = unique_labels(k);
        end
    end
    
% ---------------- Porovnání predikce a skutečné hodnoty ------------------
    if nejblizsi_trida == test_trida(i)
        pocet_spravnych = pocet_spravnych + 1;
    end
    pocet_pokusu = pocet_pokusu + 1;
end

accuracy_centroids = (pocet_spravnych / pocet_pokusu) * 100;
disp(['Úspěšnost s použitím centroidů: ', num2str(accuracy_centroids), '%']);
