load('Forecasting_workspace');

input2011=input15;
target2011=target;

k=731;
i=1;
while (i<=k)
    if (input2011(i,2)==1)
        input2011(i,:)=[]; 
        target2011(i,:)=[];
        k=k-1;
    else
        i=i+1;
    end
end