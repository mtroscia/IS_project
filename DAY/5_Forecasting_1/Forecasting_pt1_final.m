Forecasting_pt1_Divide_Data;

num_training = 15;
for i=1:10
    hiddenLayerSize = i;    %%changed to find the best value
    for j=1:10
        inDelay = j;        %%changed to find the best value
        outDelay = j;       %%changed to find the best value
        fprintf('#nodes = %d \t\t#delays = %d', hiddenLayerSize, inDelay)
        Forecasting_pt1_simple_script;
    end
end
     

