clear;
clc

load("C:\Users\honza\Desktop\škola\SaI\Uloha_12\Mirek\digits_tren.mat")
load("C:\Users\honza\Desktop\škola\SaI\Uloha_12\Mirek\digits_test.mat")

N = 1000;
M = 0;
pocet_pokusu = 0;
pocet_spravnych = 0;

tridy_vzoru = zeros(1,M);
dist = zeros(1,M);
uspesnost = zeros(1,9);

for sada = 1:9
    M = sada * 1000;
    pocet_pokusu = 0;
    pocet_spravnych = 0;

    for i = 1:N                                     % cyklus pro test. obrázky, N max.1000
        x = test_data (i,:,:);                      % načti test. obrázek
        x_trida = test_trida(i);                    % jeho třída
        for j = 1:M                                 % cyklus pro tren. vzory, M max.9000
            v = tren_data (j,:,:);                  % načti tren. obrázek
            v_trida = tren_trida(j);                % jeho třída
            tridy_vzoru(j) = v_trida;               % ulož číslo třídy do pole tridy_vzoru
%           dist(j)=sum(sum(abs(x-v)));             % urči vzdálenost a ulož do pole dist
            dist(j)=(sum(sum((x-v).^2)));           % o pjet procent výc neš ten vzorec před tím
        end
        [min_dist, index] = min(dist);              % nejmenší vzdálenost a její index
        nejblizsi_trida = tridy_vzoru(index);       % třída nejbližšího vzoru
        if x_trida == nejblizsi_trida               % je shoda?
            pocet_spravnych = pocet_spravnych + 1;  % pokud ano, započítej
        end
        pocet_pokusu = pocet_pokusu + 1;            % započítej pokus
        if mod(i,10) == 0
            prubezna_uspesnost = pocet_spravnych/pocet_pokusu * 100;
            disp(['Sada: ', num2str(sada), ' Iterace: ', num2str(i), ' Prubezna uspesnost: ', num2str(prubezna_uspesnost), '%']);
        end
    end
    uspesnost(sada) = pocet_spravnych/pocet_pokusu * 100; % urči úspěšnost
    disp(['Sada: ', num2str(sada), ' Úspěšnost: ', num2str(uspesnost(sada)), '%']); % a vypiš ji

end

bar(uspesnost)          %graf
for i = 1:length(uspesnost)
    text(i, uspesnost(i), num2str(uspesnost(i)), 'HorizontalAlignment', 'center', 'VerticalAlignment', 'bottom');
end

