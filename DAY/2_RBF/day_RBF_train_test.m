%di_comodo_input e di_comodo_output contengono inizialmente input ed output. Poi ci tolgliamo colonne fino a
%lasciarlo vuoto. train_set, test_set conterranno i dati di input,
%output_test, output_train quelli di train.

di_comodo_input=input15';
di_comodo_output=target';

% k è il numeto di colonne -1... serve per l'intervallo della rand
k=730;

%assegno i valori a train_set ed output_train (549 sono circa il 70% dei
%campioni)
for i=1:549
    n=round(rand(1)*k+1);
    k=k-1;
    train_set(:,i)=di_comodo_input(:,n);
    di_comodo_input(:,n)=[];
    output_train(1,i)=di_comodo_output(1,n);
    di_comodo_output(:,n)=[];
end;
    
k=181;

%assegno i valori a test_set ed output_test (182 sono circa il 30% dei
%campioni)

for i=1:182
    n=round(rand(1)*k+1);
    k=k-1;
    test_set(:,i)=di_comodo_input(:,n);
    di_comodo_input(:,n)=[];
    output_test(1,i)=di_comodo_output(1,n);
    di_comodo_output(:,n)=[];
end;
    
% Train the Network
net = newrb(train_set,output_train,300000,1);

% Test the Network

y = net(test_set);
e = gsubtract(output_test,y);
performance = perform(net,output_test,y)

% View the Network
view(net)
