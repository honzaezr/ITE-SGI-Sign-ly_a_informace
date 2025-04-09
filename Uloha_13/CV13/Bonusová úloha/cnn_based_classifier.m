clear all;
close all;
clc

% N...po�et testovac�ch obr�zk�
% C...po�et t��d

% na�ten� dat
% X_test...testovac� data, rozm�r: 1000x1x32x32 = NxHx32x32
    %   N=1000...po�et testovac�ch obr�zk�    
    %   H1=1...hloubka obr�zku = 1
    %   32x32...velikost obr�zku
% y_test...indexy t��d testovac�ch dat, rozm�r: 1000x1 = Nx1
load digits_tren.mat;
load digits_test.mat;
y_test = test_trida;

X_test = data_preprocessing_cnn(test_data,tren_data);
N = size(X_test,1);

%MATLAB indexuje od �isla 1 =>
%Pokud spo��t�me sk�re pro ��slovky od 0 do 9, budou tato sk�re v poli, kde
%sk�re pro ��slovku 0 bude na pozici 1 a sk�re pro ��slovku 9 na pozici 10.
%Pokud pak bude m�t nap�. ��slovka 0 maxim�ln� sk�re, bude index nejlep�� t��dy 1 nikoli 0.
%V referencich m� ale ��slovka 0 index t��dy 0 a ��slovka 9 index t��dy 9 =>
%Pokud k t�mto referen�n�m index�m p�i�teme ��slo jedna, budou indexy
%sed�t s MATLABEM a usnadn�me si vyhodnocov�n� �sp�nosti rozpozn�v�n�!
y_test = y_test + ones(1,N);

% na�ten� parametr� klasifik�toru
load cnn_based_classifier_params.mat;

tic
accuracy = 0;
%Vn�j�� cyklus pro testovac� data:
for n=1:1

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %I. V�po�et prvn� konvolu�n� vrstvy%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % PARAMETRY
    % ___________________________________________________
    % CW1...matice vah prvn� konvolu�n� vrstvy
    % rozm�r: F1xH1x3x3 = 8x1x3x3
    %   F1 = 8...po�et filtr� konvolu�n� vrstvy
        F1 = size(CW1,1);
    %   H1 = 1...hloubka vstupu konv.vrstvy = hloubka vstupnich obr�zk�
    %   3x3...velikost konvolu�n�ho filtru    
    % Cb1...matice posun� (bias�) prvn� konvolu�n� vrstvy
    % rozm�r: F1x1 = 8x1
    
    % VSTUP
    % ___________________________________________________
    % Jeden obr�zek o barevn� hloubce 1 v matici X_test
    %   rozm�ry: H1x32x32 = 1x32x32
    
    % V�STUP
    % ___________________________________________________
    % 8 vrstev v matici convout1
    %   rozm�ry: F1x32x32 = 8x32x32
    %       pro� 32?
    %       32 = 32 (velikost obr.) + 2 (roz���en� kv�li paddingu) - 3 (velikost filtru) + 1 
                   
    %Funkce squeeze odstran� prvn� dimenzi matice a vytvo�� matici 32x32       
    X_pad = squeeze(X_test(n,:,:));
    
    % Cyklus pro jednotliv� filtry t�to konvolu�n� vrstvy:
    for f=...
        %V�po�et konvoluce pro dan� filtr
        convout1(...) = filter2(squeeze............);
        
        %P�i�ten� biasu:
        ...
    end    
    %Aplikace aktiva�n� funkce ReLU pro v�echny konvolu�n� filtry:
    ....
    
    % Kontrola: convout1(1,1,1)=0.1203
    % Kontrola: convout1(2,1,1)=0.2175
           
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %II. V�po�et druh� konvolu�n� vrstvy%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % PARAMETRY
    % ___________________________________________________
    % CW2...matice vah druh� konvolu�n� vrstvy
    % rozm�r: F2xH2x3x3 = 8x8x3x3
    %   F2 = 8...po�et filtr� druh� konvolu�n� vrstvy
        F2 = size(CW2,1);
    %   H2 = 8...hloubka vstupu druh� konvolu�n� vrstvy = po�et filtr� p�edchoz�
    %   konvolu�n� vrstvy => H2 = F1 !!!!!!!!!    
        H2 = size(CW2,2);    
    %   3x3...velikost konvolu�n�ho filtru    
    % Cb2...matice posun� (bias�) druh� konvolu�n� vrstvy
    % rozm�r: F2x1 = 8x1
    
    % VSTUP
    % ___________________________________________________
    % v�stup z p�edchoz� konvolu�n� vrstvy o hlubce H1
    %   rozm�ry: H2x32x32 = 8x32x32    
    
    % V�STUP
    % ___________________________________________________
    % 8 vrstev v matici convout2
    %   rozm�ry: F2x32x32 = 8x32x32
    %       pro� 32?
    %       32 = 32 (���ka respektive v��ka vstupu) + 2 (roz���en� kv�li paddingu) - 3 (velikost filtru) + 1         
    
    %Inicializace v�stupu:
    convout2x = size(convout1,2)+2-size(CW2,3)+1;
    convout2y = size(convout1,3)+2-size(CW2,4)+1;
    convout2 = zeros(F2,convout2x,convout2y);
        
    %Cyklus pro jednotliv� filtry t�to konvolu�n� vrstvy:
    for f=....        
        temp = zeros(convout2x,convout2y);
        %Cyklus nav�c pro jednotliv� vrstvy vstupu !!       
        for h=...
            ...
            ....
        end
        convout2(f,:,:) = temp;
        %P�i�ten� biasu:
        ....
    end    
    %Aplikace aktiva�n� funkce ReLU pro v�echny v�stupn� konvolu�n� filtry:
    ...
    
     %Kontrola: convout2(1,1,1) = 0
     %Kontrola: convout2(1,1,32) = 0.0055
     %Kontrola: convout2(1,23,17) = 2.8843
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %III. V�po�et max-pool vrstvy%
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % VSTUP
    % ___________________________________________________
    % v�stup z p�edchoz� konvolu�n� vrstvy o hlubce H2
    %   rozm�ry: H2x32x32 = 8x32x32    
    
    % V�STUP
    % ___________________________________________________
    % 8 vrstev v matici maxpool
    %   rozm�ry: F2x16x16 = 8x16x16
    %       pro� 16?
    %       max pool filtr vyb�r� maximum z okenka 2x2
    %       v�stupn� velikost je polo�n� oproti vstupn�
    
    %Inicializace v�stupu:
    maxpoolout = zeros(F2,convout2x/2,convout2y/2);
    
    %Cyklus pro jednotliv� filtry t�to vrstvy:
    for f=1:F2
        for i=1:convout2x/2
            for ii=1:convout2y/2
                maxpoolout(f,i,ii)=....;
            end
        end        
    end
    
    % Kontrola: maxpoolout(1,10,5) = 5.91
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %IV. V�po�et skryt� vrstvy MLP  %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % PARAMETRY
    % ___________________________________________________
    % W1...matice vah skryt� vrstvy
    % b1...vektor bias�
    % rozm�r: DxNH = 2048x32
    %   D = 2048...8*16*16 = po�et hodnot na v�stupu p�echoz� max-pool
    %   vrstvy
    %   NH = 32...zvolen� po�et neuron� skryt� vrstvy MLP s�t�                
    % VSTUP
    % ___________________________________________________
    % v�stup z p�edchoz� max-pool vrstvy
    %   rozm�ry: D = 8*16*16    
    
    % V�STUP
    % ___________________________________________________
    % 32 hodnot
    
    %P�evedeme matici 8x16x16 po ��dc�ch na vektor 1x2048, maxpoolout(:) nelze pou��t, p�evoded je takto prov�d�n po sloupc�ch !!
    %Po ��dc�ch p�ev�d�me proto, proto�e stejn� p�ev�d�l i tr�novac� software !!    
    tmp = permute(...);
    tmp = reshape(...);
    
    %N�soben� vahami a p�i�ten� biasu
    mlpout1 = ...
    
    %ReLU:
    ...
    
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    %V. V�po�et v�stupn� vrstvy  %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    % PARAMETRY
    % ___________________________________________________
    % W2...matice vah v�stupn� vrstvy
    % b2...vektor bias� v�stupn� vrstvy
    % rozm�r: NHxC = 32x10
    %   NH = 32...zvolen� po�et neuron� skryt� vrstvy MLP s�t�        
    %   C = 10...po�et t��d
    % VSTUP
    % ___________________________________________________
    % v�stup z p�edchoz� skryt� vrstvy
    %   rozm�r: NH = 32    
    % V�STUP
    % ___________________________________________________
    %   rozm�r: C = 10 ... po�et t��d
    
    %N�soben� vahami a p�i�ten� biasu
    mlpout2 = ...;
    
    %Pro v�b�r maxima zde ji� nen� pot�eba aplikovat ReLU!   
    %Pokud ji aplikujeme, doje k o��znut� v�ech hodnot < 0 na 0 a t�m
    %p�dem dostaneme pro n�kter� obr�zek �patn� v�sledek klasifikace
    
    %%%%%%%%%%%%%%%%%%
    %V. KLASIFIKACE  %
    %%%%%%%%%%%%%%%%%%
    [maxvalue, predict] = max(mlpout2);        
    if (predict == y_test(n))
        accuracy = accuracy+1;
    end            
    if mod(n,10) == 0
        fprintf('n: %i, p�esnost : %f\n', n,100*accuracy/n);
    end
    
        
end   
fprintf('P�esnost : %f\n', 100*accuracy/N);
toc 
