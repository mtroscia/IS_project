media=0;
for l=1:100
    %di_comodo_input e di_comodo_output contengono inizialmente input ed output. Poi ci tolgliamo colonne fino a
    %lasciarlo vuoto. 
    
    di_comodo_input=input23;
    di_comodo_output=target;

    % k è il numeto di colonne -1... serve per l'intervallo della rand
    k=17378;

    for i=1:7500
        n=round(rand(1)*k+1);
        k=k-1;
        example_feature(i,:)=di_comodo_input(n,:);
        di_comodo_input(n,:)=[];
        example_output(i,1)=di_comodo_output(n,1);
        di_comodo_output(n,:)=[];
    end;

    % Test the Network
    output= evalfis(example_feature,rete_fuzzy);

    %errore su ogni singolo esempio
    e = gsubtract(example_output,output); 

    %mi manca solo il MSE
    MSE=0;

    for i=1:7500;
        MSE=MSE+e(i,1)*e(i,1);
    end

    MSE=MSE/7500;
    
    media=media+MSE;

    MSE
    
end;

media=media/100