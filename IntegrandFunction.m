
clc;
clear all;
close all;
% Integrand as a MatLab function
a = input('start');
b = input('end');

for i = a:b
     c(i) = calci(i);
end
stem(c);
title("INTEGRAND PLOT");
xlabel("range of the Integrand");
ylabel("the integrand value for each point in range");



function inte = calci(xS)

    inte= exp(-(xS-3)^2);
    % disp(integrand);
end