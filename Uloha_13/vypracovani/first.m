clear all;
close all;
clc

load digits_test;
% N...poèet testovacích obrázkù = 1000
% y_test...indexy tøíd testovacích dat, rozmìr: 1000x1 = Nx1
y_test = test_trida;
%MATLAB indexuje od èisla 1 =>
%Pokud spoèítáme skóre pro èíslovky od 0 do 9, budou tato skóre v poli, kde
%skóre pro èíslovku 0 bude na pozici 1 a skóre pro èíslovku 9 na pozici 10.
%Pokud pak bude mít napø. èíslovka 0 maximální skóre, bude index nejlepší tøídy 1 nikoli 0.
%V referencich má ale èíslovka 0 index tøídy 0 a èíslovka 9 index tøídy 9 =>
%Pokud k tìmto referenèním indexùm pøièteme èíslo jedna, budou indexy
%sedìt s MATLABEM a usnadníme si vyhodnocování úspìšnosti rozpoznávání!
N = size(y_test,2);
y_test = y_test + ones(1,N);

load digits_tren;
% Testovací data je nutné nejprve pøedzpracovat:
    % Je nutné je normalizovat = odeèíst støední hodnotu trénovacích dat
        % Pøípadnì je možné je i vycentrovat
    % Dále jsou v rámci pøedzpracování testovací data pøevedena z matice
    % Nx32x32 do matice Nx(32*32+1)

X_test = data_preprocessing(test_data,tren_data);
% Funkce data_preprocessing lze optimalizovat pomoci vektorovych operaci. 
%X_test = data_preprocessing_fast(test_data,tren_data);

% naètení matice vah
% D...dimenze = a*b+1, kde a je výška a b je šíøka obrázku = 1025
% C...poèet tøíd = 10
% W...matice vah klasifikátoru, rozmìr: DxC 1025x10 = 
load multiclass_perceptron_params.mat;
D = size(W,1);
C = size(W,2);

%Nyní jsou k dispozici pøipravená testovací data v matici X_test a
%parametry klasifikátoru v matici W

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% KLASIFIKACE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%I. Výpoèet úspìšnosti (pøesnosti) = accuracy pomocí dvou cyklù%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

tic
accuracy = 0;
% ========================== VÁŠ KÓD ZDE ======================
% cyklus pres testovací data:
for i=1:N        
    maxscore = realmin('single'); %score nejlepší tøídy   
    predict = -1; %Index nejlepší tøídy
    % cyklus pres jednotlivé tøídy:
    for c=1:C    
        %score = sigmoid( i-ty radek v X_test * c-ty sloupek v W )
        % score = sigmoid_scalar(...)
        score = sigmoid_scalar(X_test(i, :) * W(:, c));
        % najdete tridu s nejvyssim skore
        if(score > maxscore)
              maxscore = score;
              predict = c;
        end
    end
    if (predict == y_test(i)) %Lze zapsat takto díky posunutí indexù, jinak by muselo být predict == y_test(i) + 1
        accuracy = accuracy+1;
    end
end
% Kontrola: první vypoètená hodnota score = 0.7729
% Kontrola: accuracy = 49%
% =============================================================
fprintf('Pøesnost pomocí dvou vnoøených cyklù: %f\n', 100*accuracy/N);
toc