clc;
clear all;

load dadoscontrolador.mat;

t = dados(1,:);
yo = dados(2,:); %observador, erro 
r = dados(3,:); %entrada de refer�ncia
y = dados(4,:); %sa�da
q = dados(5,:); %entrada do processo 

plot(t,r,t,y);
