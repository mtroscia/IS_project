%completa conterra l'intero set di esempi
completa=input15;
completa(:,6)=target(:,1);

%ora bisogna creare 3 set: trainig, testing e checking
%training=70% (511 sample)-testing=15% (110 sample)-checking=15% (110 sample)

di_comodo=completa;

% k è il numeto di colonne -1... serve per l'intervallo della rand.
% iniziamo da trainig
k=510;

for i=1:511
    n=round(rand(1)*k+1);
    k=k-1;
    training_set(i,:)=di_comodo(n,:);
    di_comodo(n,:)=[];
end;

%ora facciammo testing e checking
k=219;

for i=1:110
    n=round(rand(1)*k+1);
    k=k-1;
    testing_set(i,:)=di_comodo(n,:);
    di_comodo(n,:)=[];
    n=round(rand(1)*k+1);
    k=k-1;
    checking_set(i,:)=di_comodo(n,:);
    di_comodo(n,:)=[];
end;