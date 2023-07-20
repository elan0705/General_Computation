clc;
clear all;
close all;

h= input("step_size:");  %user defined input for step size
y(1)=1;                  %the initial o/p for x=0 => y(0)=1
x=11;                    %the no. of iterations to be performed



%EULER


%loop to perform the total no. of iterations
for n=2:x
    f(n)=funct(x, y(n-1)); %storing the function value into a variable
    y(n)= y(n-1)+h.*f(n);  %calulating the euler o/p
                   %displays the euler values stored in the vector
end
figure;
plot(y);
title('Euler');
xlabel('x');
ylabel('y');



%MIDPOINT


%loop to perform for intermediate step
mid(1)=y(1);
for n=2:x
g(n)=funct(x, mid(n-1));      %storing the function value into a variable
mid(n+1)= mid(n-1)+h/2.*f(n); %calculate the value of intermediate step y(n+1/2)
ak = 0:h/2:11;
%loop to perform the total no. of iterations
for m=2:length(ak)
   g(m)= funct(x, mid(n+1));  %storing the function value into a variable
   mid(n)= mid(n)+ h.*g(m);   %calulating the midpoint o/p
                     %displays the midpoint values stored in the vector
end
end
figure;
plot(g);
title('Midpoint');
xlabel('x');
ylabel('y');



%RUNGE_KUTTA


rung = zeros(1,length(x));
rung(n)=y(1);
%loop to perform the total no. of iterations
for n= 2:1:x
    l(n)=funct(x, rung(n-1)); %storing the function value into a variable
    a(n+1)= h.*l(n);          % calc. a (4 intermediate steps)
    
    q(n)= funct((x+(h/2)), (rung(n-1)+(a(n+1)/2))); %storing the function value into a variable
    b(n+1)= h.*q(n);                                % calc. b (4 intermediate steps)
    
    w(n)= funct((x+(h/2)), (rung(n-1)+(b(n+1)/2))); %storing the function value into a variable
    c(n+1)= h.*w(n);                                % calc. c (4 intermediate steps)
    
    t(n)= funct((x+h), (rung(n-1)+ c(n+1))); %storing the function value into a variable
    d(n+1)= h.*t(n);                             % calc. d (4 intermediate steps)
    
    
    rung(n+1)= rung(n-1)+ ((1/6).*(a(n+1)+2.*b(n+1)+2.*c(n+1)+d(n+1))); %calulating the runge_kutta o/p
                                      %displays the runge_kutta values stored in the vector
end
figure;
plot(rung);
title('RUNGE KUTTA');
xlabel('x');
ylabel('y');


    
%defining a function to evaluate function value taking two i/p
function eval= funct(x, y)
eval= -y + (1/ (1 + (exp(-5.*y) .* exp(5)))); %ODE
end