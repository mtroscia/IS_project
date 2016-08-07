load('HOUR_data');

goal = 1000;
spread = 1;         %%changed to find the best value
max_neurons = 200;
for i=1:5           %%we check the performances of the spread choosen 5 times in a row
    HOUR_RBF_Divide_Sets;
    HOUR_RBF_simple_script;
end