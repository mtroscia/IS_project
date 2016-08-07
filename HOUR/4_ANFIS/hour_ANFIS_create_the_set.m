%completa conterra l'intero set di esempi
completa=input23;
completa(:,6)=target(:,1);

%ora bisogna creare 3 set: trainig, testing e checking

di_comodo=completa;

% k è il numeto di colonne -1... serve per l'intervallo della rand.
% iniziamo da trainig
k=12178;

for i=1:12179
    n=round(rand(1)*k+1);
    k=k-1;
    training_set(i,:)=di_comodo(n,:);
    di_comodo(n,:)=[];
end;

k=5199;
for i=1:2600
    n=round(rand(1)*k+1);
    k=k-1;
    testing_set(i,:)=di_comodo(n,:);
    di_comodo(n,:)=[];
    n=round(rand(1)*k+1);
    k=k-1;
    checking_set(i,:)=di_comodo(n,:);
    di_comodo(n,:)=[];
end;