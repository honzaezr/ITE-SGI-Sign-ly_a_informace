function x_out = data_preprocessing_fast(x_in,x_tren_in)
    % x_in...vstupn� testovaci data data, rozm�r: 1000x32x32 = Ntest x 32 x 32
    % x_tren_in...vstupn� trenovac� data, rozm�r: 9000x32x32 = Ntren x 32 x 32
    % x_out...v�stupn� testovac� data

     % ========================== V�� K�D ZDE ======================
    % Nejprve st�edn� hodnota jednotliv�ch pixel� tr�novac�ch obr�zk� pomoc� p��kazu mean:
    norm_factor = mean(x_tren_in,1);    

    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    % Proveden� normalizace bez cyklu %
    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % Normalizaci x_in ode�ten�m vypo�ten�ch 32 st�edn�ch hodnot lze zapsat i bez pou�it� cyklu for jako maticovou operaci pomoc� p��kazu
    % REPMAT s parametrem N:
    N = size(x_in,1);
    % ========================== V�� K�D ZDE ======================
    x_out = x_in - repmat(norm_factor,N,1);    
    % Kontrola: x_out(10,10,10) = 4.83
    % =============================================================                    
end
