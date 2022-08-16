clear all
clc 
close all
% first DSP lab simulation
% Pendulum motion under friction
% system parameter
m = 0.1;
L = [1,2,3,4,5]';
g = 10;
b = 0.01;
 
% Algorithm 
% Step by step solution
h=0.05;
Tht =[];
for i=1:5
    % Initial Condition
 
    tht(1)=pi/3;
    tht(2)=tht(1);
    tme(1)=0;
    tme(2)=h;
    % Simulation time
 
    tmax=10;
    N=round(tmax/h);
 
    % Simulation loop
    d = 1+h*b/m;
    alf1 = 1+1/d;
    alf2 = -1/d;
    bta  = -g*h^2/(L(i)*d);
    for n=3:N
        tme(n)=(n-1)*h;
        tht(n)=alf1*tht(n-1)+alf2*tht(n-2)+bta*sin(tht(n-1));
    end
    Tht=[Tht tht(:)];
end
plot(tme,Tht,'.','MarkerSize',10)
title('Pendulum Simulation','FontSize',25)
xlabel('time(s)','FontSize',18);
ylabel('theta(rad)','FontSize',18);
set(gca,'FontSize',20);
grid on
shg