clc;
clear all;
close all;

h= input("step_size:");
y(1)=1;
x=11;
for n=2:x
f(n)= -y(n-1)+ (1/ (1 + (exp(-5.*y(n-1)) .* exp(5))));
y(n+1)= y(n-1)+h/2.*f(n);
ak = 0:h/2:11;
for m=2:length(ak)
    f(m)= -y(n+1) + (1/ (1 + (exp(-5.*y(n+1)) .* exp(5))));
    midpoint_val(n)= y(n)+ h.*f(m);
    disp(y);
end
end


