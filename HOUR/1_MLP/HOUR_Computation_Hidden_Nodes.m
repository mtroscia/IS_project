num_training = 15;
for hiddenLayerSize=1:15
    fprintf('hiddenLayerSize: \t %d \n', hiddenLayerSize);
    HOUR_MLP_simple_script;
end