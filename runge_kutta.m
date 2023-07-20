clear all 
close all
clc
h = input('step_size');  % set the step size
x =11;  % set the interval of x
y = zeros(1,length(x));
y(1) =1;   % set the intial value for y
for n= 2:1:x
    f(n)= -y(n-1)+ (1/ (1 + (exp(-5.*y(n-1)) .* exp(5))));
    a(n+1)= h.*f(n);
    
    q=y(n-1)+h/2;
    w=1 + (exp(-5.*  (y(n-1)+a(n+1)/2)  ) .* exp(5));
    k(n)= -q+ (1/w);
    b(n+1)= h.*k(n);
    
    e=y(n-1)+h/2;
    r=1 + (exp(-5.*  (y(n-1)+b(n+1)/2) ) .* exp(5));
    l(n)= -e+ (1/r);
    c(n+1)= h.*l(n);
    
    t=y(n-1)+h;
    u=1 + (exp(-5.*  (y(n-1)+c(n+1)) ) .* exp(5));
    m(n)= -t+ (1/u);
    d(n+1)= h.*m(n);
    
    
    y(n+1)= y(n-1)+ ((1/6).*(a(n+1)+2.*b(n+1)+2.*c(n+1)+d(n+1)));
    disp(y);
end