load dadoscontrolador.mat;

t = dados(1,:)'; %tempo 
y = dados(2,:)'; %posi��o do carrinho 
x = dados(3,:)'; %sinal de entrada
u = dados(4,:)'; %saida da  banda morta
s = dados(5,:)'; %saida da satur��o 
i = dados(6,:)'; %sa�da do integrador 
d = dados(7,:)'; %sa�da do derivador 
p = dados(8,:)'; %sa�da do proporcional 
c = dados(9,:)'; %sa�da do compensador 


plot(t,x,t,y);