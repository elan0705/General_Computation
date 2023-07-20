x = [2 4 3 1 6 2 2.5 7 10];
yu = logi(x)
%%function to calculate the logrithamic likelihood 
function  logrithamimic_likelyhood = logi(x)
a=zeros(1,10);
a=[x a];
for ishapeValues=1:10
        prob(ishapeValues)=wblpdf(a(ishapeValues), 6, ishapeValues); %Weibull probability density function
   		disp(prob);
        logrithamimic_likelyhood(ishapeValues)=log(prob(ishapeValues)); %calculating the log of the resultant density function
    		disp(logrithamimic_likelyhood);
end
plot(logrithamimic_likelyhood);
maxi= max(logrithamimic_likelyhood); % maximum likelihood estimator
disp("maxi"+maxi);
%dt = sum(logrithamimic_likelyhood);
%disp(dt);
end
