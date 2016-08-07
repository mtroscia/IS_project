%%creazione delle serie di input e di output
X = tonndata(input2012,false,false);
T = tonndata(target2012,false,false);

%creation of the network

inputDelays = 1:delay;
feedbackDelays = 1:delay;

net = narxnet(inputDelays, feedbackDelays, hiddenLayerSize);


%%%MULTI-STEP PREDICTION

%%We divide the pool of data into 12 blocks corresponding approximately to
%%the 12 months; the first 15 days of each month are used for train; the
%%last 15 days or part of them is used to evaluate the performance in
%%forecasting

for i=0:11
    
%train: effettuato sulla rete in ciclo aperto
inputSeries = X((i*30+1):((i*30+15+delay)));
targetSeries = T((i*30+1):((i*30+15+delay)));
[xs,xi,ai,ts] = preparets(net, inputSeries, {}, targetSeries);
net = train(net, xs, ts, xi, ai);
%view(net);
y = net(xs, xi, ai);
end
for j=0:11
inputSeriesPred = X((j*30+15+delay):(30*(j+1)+1)-(15-forecastedDays));
targetSeriesPred = [T(j*30+15+delay), con2seq(nan(1,forecastedDays))];       %%NAN to force the prediction 
                                                                        
netc = closeloop(net);
%view(netc);
[xs,xi,ai,ts] = preparets(netc, inputSeriesPred, {}, targetSeriesPred);
yPred = netc(xs, xi, ai);

fprintf('Performance nella previsione di %d giorni per il mese %d in anello chiuso', forecastedDays, j+1);
perfAhead = perform (netc, yPred, T(end-forecastedDays+1:end))       %%accuracy of forecasting is evaluated comparing results
                                                        %%with the data of the original series
end