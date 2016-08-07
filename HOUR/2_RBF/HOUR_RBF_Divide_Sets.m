%%%we have to divide the 17379 samples of the input matrix (input23) into the
%%%train test and the test set
app_x = input23';
app_t = target';

k = 17378;

for i=1:13034 %%for the train set we keep about 70% of samples
    n = round(rand(1)*k+1);
    k = k-1;
    train_set(:,i) = app_x(:,n);
    train_out(:,i) = app_t(:,n);
    app_x(:,n) = [];
    app_t(:,n) = [];
end
k = 4344;
for i=1:4345    %%for the test set we keep about 30% of samples
    n = round(rand(1)*k+1);
     k = k-1;
   test_set(:,i) = app_x(:,n);
   test_out(:,i) = app_t(:,n);
    app_x(:,n) = [];
    app_t(:,n) = [];
end 