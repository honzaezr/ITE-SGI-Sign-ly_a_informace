% Program perceptronDemo vizuálně demonstruje algoritmus 
% učení perceptronu na vygenerovaných datech 2 tříd.
% Vychází z prezentace na 13. cvičení předmětu SGI
% Autor JN, 2024.
      
clear all; clf

% vygenerujeme vzorky ze dvou trid pro trenovani  
numSamples = 100;
% kazda trida ma sve pravdepodobnostni rozlozeni 
meanA = [5 7]; sigmaA = [2.6 0; 0 1.2];
meanB = [2 3]; sigmaB = [1.7 0; 0 1.0];
[samplesA, samplesB, classA, classB] = generateTwoClassData (numSamples, meanA, meanB, sigmaA, sigmaB);

% z vygenerovanych vzorku obou trid sestavime trenovaci sadu a zaroven 
% k priznakum x1 a x2 pridame treti hodnotu rovnou 1 (kvuli zjednoduseni nasobeni)
xTrain = [samplesA; samplesB];   
xTrain = [xTrain ones(numSamples,1)];  % pridana 1 
classTrain = [classA; classB];

% trenovani perceptronu
wInit = [0, 1, -1] % pocatecni hodnoty vah
lambda = 0.01;  % pocatecni hodnoty uciciho faktoru
maxIter = 20;  % maximalni pocet iteraci pri trenovani
w = trainPerceptron (xTrain, classTrain, lambda, wInit, maxIter, samplesA, samplesB)

% funkce pro trenovani vcetne zobrazovani vzorku a pozice primky
function w = trainPerceptron (xTrain, xClass, lambda, w, maxIter, objectA, objectB )
    for iter = 1 : maxIter;
        lambda = lambda * 0.9  % lambda snizujeme s kazdou dalsi iteraci
        for i=1:size (xTrain, 1);
            x = xTrain(i,:);    % vybran i-ty vzorek
            ys = xClass(i);     % pozadovana (spravna) hodnota vystupu 
            y = sign(x * w');   % skutecna hodnota vystupu 
            if y ~= ys
               w = w + (ys - y) * x * lambda;  % modifikace vah 
               plotSamples (objectA, objectB)  % vykresleni vzorku obou trid
               plotDivideLine (w)              % vykresleni pozice primky 
               pause (0.1)    % nastaveni rychlosti animace
            end
        end
     end
end

% funkce pro vygenerovani pozadovaneho poctu vzorku ze dvou trid
function [samplesA, samplesB, classA, classB] = generateTwoClassData (number, meanA, meanB, sigmaA, sigmaB)
    numA = number/2;       % vzorky z tridy A tvori polovinu vsech vzorku 
    numB = number - numA;  % vzorky z tridy B tvori zbytek 
    samplesA = mvnrnd(meanA, sigmaA, numA); % zde se vygeneruji vzorky tridy A
    samplesB = mvnrnd(meanB, sigmaB, numB); % zde se vygeneruji vzorky tridy B
    classA = ones (numA,1);        % trida A je oznacena hodnotou +1
    classB = ones (numB,1) * (-1); % trida B je oznacena hodnotou -1
end

% funkce pro vykresleni pozic vzorku z obou trid
function plotSamples (samplesA, samplesB)
    clf
    % vykresli ruznymi barvami vzorky 2 trid
    plot(samplesA(:,1),samplesA(:,2),'o', 'MarkerFaceColor',[1 0 0]);
    hold on
    plot(samplesB(:,1),samplesB(:,2),'o', 'MarkerFaceColor',[1 1 0]);
    hold on
    xlabel ('x1')
    ylabel ('x2')
    xlim ([0, 10])
    ylim ([0, 10])
end

% funkce pro vykresleni primky na zaklade hodnot w
function plotDivideLine (w)
    % primku urcime 2 body, zde se souradnicemi x1 = 0 a x1 = 10,
    % k nimz dopocitame odpovidajici souradnice x2 
    x1 = [0, 10];
    x2 = (-w(1)* x1 -w(3))/w(2);  % rovnice primky odvozena v prezentaci
    plot (x1, x2, 'b')
    Title   = sprintf('Linear classifier parameters: %0.2f x_1 + %0.2f x_2 + %0.2f = 0', w(1), w(2), w(3));
    title(Title );
end



% ------- Samostatna prace pro studenty -----




