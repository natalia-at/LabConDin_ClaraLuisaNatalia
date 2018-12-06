load dadoscontrolador.mat;

t = dados(1,:)'; %tempo 
y = dados(2,:)'; %posição do carrinho 
x = dados(3,:)'; %sinal de entrada
u = dados(4,:)'; %saida da  banda morta
s = dados(5,:)'; %saida da saturção 
i = dados(6,:)'; %saída do integrador 
d = dados(7,:)'; %saída do derivador 
p = dados(8,:)'; %saída do proporcional 
c = dados(9,:)'; %saída do compensador 


plot(t,x,t,y);