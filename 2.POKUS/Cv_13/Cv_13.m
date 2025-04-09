clear;
close all;
clc

%% ------------------- Generace vzroků pro trenovani ----------------------
numSamples = 100;
% kazda trida ma sve pravdepodobnostni rozlozeni 
meanA = [5 7]; sigmaA = [2.6 0; 0 1.2];
meanB = [2 3]; sigmaB = [1.7 0; 0 1.0];
[samplesA, samplesB, classA, classB] = generateTwoClassData(numSamples, meanA, meanB, sigmaA, sigmaB);

% z vygenerovanych vzorku obou trid sestavime trenovaci sadu a zaroven 
% k priznakum x1 a x2 pridame treti hodnotu rovnou 1 (kvuli zjednoduseni nasobeni)
xTrain = [samplesA; samplesB];   
xTrain = [xTrain ones(numSamples,1)];  % pridana 1 
classTrain = [classA; classB];

%% ---------------------- Trenovani perceptronu ---------------------------
wInit = [0, 1, -1]; % pocatecni hodnoty vah
lambda = 0.01;  % ucici faktor
maxIter = 20;  % maximalni pocet iteraci pri trenovani
w = trainPerceptron(xTrain, classTrain, lambda, wInit, maxIter, samplesA, samplesB);

%% -------------------------- Testování -----------------------------------
% Vygenerování testovacích dat
numTestSamples = 50;
[samplesATest, samplesBTest, classATest, classBTest] = generateTwoClassData(numTestSamples, meanA, meanB, sigmaA, sigmaB);

% Příprava testovacích dat
xTest = [samplesATest; samplesBTest];
xTest = [xTest ones(numTestSamples, 1)]; % Přidání jedničky pro bias
classTest = [classATest; classBTest];

% Testování na trénovacích datech
trainAccuracy = testPerceptron(xTrain, classTrain, w);

% Testování na testovacích datech
testAccuracy = testPerceptron(xTest, classTest, w);

%% ------------------------ Výpis výsledků --------------------------------
disp(['Procento správně klasifikovaných trénovacích vzorků = ', num2str(trainAccuracy)]);
disp(['Procento správně klasifikovaných testovacích vzorků = ', num2str(testAccuracy)]);

%% --------------------------- Funkce -------------------------------------

% Funkce pro trénování perceptronu
function w = trainPerceptron(xTrain, xClass, lambda, w, maxIter, objectA, objectB)
    for iter = 1:maxIter
        lambda = lambda * 0.9; % lambda snizujeme s kazdou dalsi iteraci
        for i = 1:size(xTrain, 1)
            x = xTrain(i,:);    % vybran i-ty vzorek
            ys = xClass(i);     % pozadovana (spravna) hodnota vystupu 
            y = sign(x * w');   % skutecna hodnota vystupu 
            if y ~= ys
               w = w + (ys - y) * x * lambda;  % modifikace vah 
               plotSamples(objectA, objectB);  % vykresleni vzorku obou trid
               plotDivideLine(w);              % vykresleni pozice primky 
               pause(0.1);    % nastaveni rychlosti animace
            end
        end
    end
end

% Funkce pro testování perceptronu
function accuracy = testPerceptron(xTest, classTest, w)
    correct = 0; 
    for i = 1:size(xTest, 1)
        x = xTest(i, :);
        y = sign(x * w'); % Výstup perceptronu
        if y == classTest(i)
            correct = correct + 1;
        end
    end
    accuracy = (correct / size(xTest, 1)) * 100;
end

% Funkce pro vygenerovani pozadovaneho poctu vzorku ze dvou trid
function [samplesA, samplesB, classA, classB] = generateTwoClassData(number, meanA, meanB, sigmaA, sigmaB)
    numA = number / 2;       % vzorky z tridy A tvori polovinu vsech vzorku 
    numB = number - numA;    % vzorky z tridy B tvori zbytek 
    samplesA = mvnrnd(meanA, sigmaA, numA); % zde se vygeneruji vzorky tridy A
    samplesB = mvnrnd(meanB, sigmaB, numB); % zde se vygeneruji vzorky tridy B
    classA = ones(numA, 1);        % trida A je oznacena hodnotou +1
    classB = ones(numB, 1) * (-1); % trida B je oznacena hodnotou -1
end

% Funkce pro vykresleni pozic vzorku z obou trid
function plotSamples(samplesA, samplesB)
    clf
    % Vykresli ruznymi barvami vzorky 2 trid
    plot(samplesA(:,1), samplesA(:,2), 'o', 'MarkerFaceColor', [1 0 0]);
    hold on
    plot(samplesB(:,1), samplesB(:,2), 'o', 'MarkerFaceColor', [1 1 0]);
    hold on
    xlabel('x1')
    ylabel('x2')
    xlim([0, 10])
    ylim([0, 10])
end

% Funkce pro vykresleni primky na zaklade hodnot w
function plotDivideLine (w)
    % primku urcime 2 body, zde se souradnicemi x1 = 0 a x1 = 10,
    % k nimz dopocitame odpovidajici souradnice x2 
    x1 = [0, 10];
    x2 = (-w(1)* x1 -w(3))/w(2);  % rovnice primky odvozena v prezentaci
    plot (x1, x2, 'b')
    Title   = sprintf('Linear classifier parameters: %0.2f x_1 + %0.2f x_2 + %0.2f = 0', w(1), w(2), w(3));
    title(Title );
end
