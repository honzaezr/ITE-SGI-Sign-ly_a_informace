% Uloha2.m
clear all;
clc;

% 1. Načtení dat
datadir = 'C:\Users\honza\Desktop\škola\SaI\2.POKUS\Cv_12'; % Zadejte cestu k adresáři s obrázky
file_list = dir(fullfile(datadir, '*.jpg'));

% Předem připravené proměnné
train_files = {}; % Trénovací soubory
test_files = {};  % Testovací soubory
train_labels = [];
test_labels = [];

% Rozdělení dat na základě názvu souborů
for i = 1:length(file_list)
    file_name = file_list(i).name;
    % Extrakce labelu z názvu souboru (první znak 'cX')
    label = str2double(file_name(2));
    if contains(file_name, '_s01') || contains(file_name, '_s02') || contains(file_name, '_s03') || contains(file_name, '_s04')
        test_files{end+1} = fullfile(datadir, file_name);
        test_labels(end+1) = label;
    else
        train_files{end+1} = fullfile(datadir, file_name);
        train_labels(end+1) = label;
    end
end

% 2. Klasifikace pomocí vzorů
disp('Klasifikace pomocí vzorů...');
correct_count = 0;
total_count = 0;

for i = 1:length(test_files)
    x = imread(test_files{i});
    x = double(x(:)); % Převedení na vektor
    
    min_dist = inf;
    predicted_label = -1;
    
    for j = 1:length(train_files)
        v = imread(train_files{j});
        v = double(v(:)); % Převedení na vektor
        
        % Výpočet L1 vzdálenosti
        dist = sum(abs(x - v));
        
        if dist < min_dist
            min_dist = dist;
            predicted_label = train_labels(j);
        end
    end
    
    % Porovnání predikce a skutečné hodnoty
    if predicted_label == test_labels(i)
        correct_count = correct_count + 1;
    end
    total_count = total_count + 1;
end

accuracy_patterns = (correct_count / total_count) * 100;
disp(['Úspěšnost s použitím vzorů: ', num2str(accuracy_patterns), '%']);

% 3. Klasifikace pomocí centroidů
disp('Klasifikace pomocí centroidů...');
% Vytvoření centroidů
unique_labels = unique(train_labels);
centroids = zeros(length(unique_labels), numel(x));

for k = 1:length(unique_labels)
    % Seřaďte všechny obrázky příslušné třídě
    class_images = train_files(train_labels == unique_labels(k));
    class_data = [];
    
    for img = 1:length(class_images)
        v = imread(class_images{img});
        v = double(v(:)); % Převedení na vektor
        class_data = [class_data; v'];
    end
    
    % Vypočítejte centroid (průměr)
    centroids(k, :) = mean(class_data, 1);
end

% Testování s centroidy
correct_count = 0;
total_count = 0;

for i = 1:length(test_files)
    x = imread(test_files{i});
    x = double(x(:)); % Převedení na vektor
    
    min_dist = inf;
    predicted_label = -1;
    
    for k = 1:length(unique_labels)
        % Výpočet L1 vzdálenosti k centroidu
        dist = sum(abs(x - centroids(k, :)'));
        
        if dist < min_dist
            min_dist = dist;
            predicted_label = unique_labels(k);
        end
    end
    
    % Porovnání predikce a skutečné hodnoty
    if predicted_label == test_labels(i)
        correct_count = correct_count + 1;
    end
    total_count = total_count + 1;
end

accuracy_centroids = (correct_count / total_count) * 100;
disp(['Úspěšnost s použitím centroidů: ', num2str(accuracy_centroids), '%']);
