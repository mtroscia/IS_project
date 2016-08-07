%%%train and test sets have been previously created

%%Create and train the network
net = newrb(train_set,train_out,goal,spread,max_neurons);
     
% Test the Network
y = net(test_set);
error = gsubtract(test_out,y);
performance = perform(net,test_out,y)

% View the Network
view(net)

% Plots
% Uncomment these lines to enable various plots.
%figure, plotperform(tr)
%figure, plottrainstate(tr)
%figure, plotfit(net,x,t)
%figure, plotregression(t,y)
%figure, ploterrhist(e)

