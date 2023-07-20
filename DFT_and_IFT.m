clc; 
close all;
clear all;
%Discrete Fourier Transform 
Fs=2048;
f0=10;
ind=1:2048;
t=(1:2048)/Fs;
s=[-ones(1,1024) sin(2*pi*f0*t(1025:2048)+ 1.0)];
s=s+.2.*randn(1,2048);
plot(t,s);
baseCos = zeros(1024,2048);
baseSin = zeros(1024,2048);
for k=0:1024
    baseCos(k+1,:)= cos(2*pi*k*ind/2048);
    baseSin(k+1,:)= sin(2*pi*k*ind/2048);
end
for k=1:4   
    subplot(4,1,1)   
    plot(t,baseCos(1,:),t,baseSin(1,:));
    xlabel('freqz Hz');
    ylabel('amp V');
    subplot(4,1,2)
    plot(t,baseCos(2,:),t,baseSin(2,:));
    xlabel('freqz Hz');
    ylabel('amp V');
    subplot(4,1,3)
    plot(t,baseCos(3,:),t,baseSin(3,:));
    xlabel('freqz Hz');
    ylabel('amp V');
    subplot(4,1,4)   
    plot(t,baseCos(4,:),t,baseSin(4,:));
    
end
for k=1:1025   
    Re(k) =  sum(s .* baseCos(k,:));    
    Im(k) = -sum(s .* baseSin(k,:)); 
end
plot(0:19,Re(1:20),'r*',0:19,Im(1:20),'g*');
xlabel('freqz Hz');
ylabel('Co-eff val');

%Inverse Fourier Transform
ReH = Re/1024;ImH = -Im/1024;
ReH(1) = Re(1)/2048;
ReH(1024) = Re(1025)/2048;
sH = zeros(1025,2048);
for k=1:1025   
    sH(k,:) = ReH(k).* baseCos(k,:) + ImH(k) .* baseSin(k,:);  
end
figure;
subplot(5,1,1);
plot(t,sum(sH(1:3,:),1));
subplot(5,1,2);
plot(t,sum(sH(1:9,:),1));
subplot(5,1,3);
plot(t,sum(sH(1:15,:),1));
subplot(5,1,4);
plot(t,sum(sH(1:100,:),1));
subplot(5,1,5);
plot(t,sum(sH(1:1025,:),1));
