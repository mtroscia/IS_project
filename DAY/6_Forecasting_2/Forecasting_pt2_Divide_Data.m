load('Forecasting_workspace');

input2012=input15;
target2012=target;

k=731;
i=1;
while (i<=k)
    if (input2012(i,2)==0)
        input2012(i,:)=[]; 
        target2012(i,:)=[];
        k=k-1;
    else
        i=i+1;
    end
end