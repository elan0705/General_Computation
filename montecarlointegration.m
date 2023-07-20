clc;
close all;
clear all;
 
a =[1,1,1,1,1,1,1,1,1]; %input('start');
b =2:10; %input('end');
N = logspace(1,9,1000);
intMC = zeros(1,1000);
Err=zeros(1,1000);
for u = 1:9
        t(u)= a(u)+(b(u)-a(u));
        xS = t(u).*rand(u,1);
end
for i = 1:1000
    
    % samples
        d= calc(xS);
    % Monte Carlo integration
    for u=1:9
        intMC(u)= (b(u)-a(u)).*sum(d)/N(i);
        g= d.^2+Err(i);
        %Er=sqrt(g/b(u)-intMC(i).^2)./sqrt(b(u));
    end
   
end

plot(intMC);
hold on
%stem(Er);
legend('MonteCarlo','error');
title('MONTE CARLO INTEGRATION');
ylabel('f(x)');
xlabel('samples(xi)');
hold off
figure;
plot(d);
title("INTEGRAND PLOT");
xlabel("range of the Integrand");
ylabel("each point in range");
function integrand = calc(xS)
 
    integrand= exp(-(xS-3).^2);
    
    % disp(integrand);
end
