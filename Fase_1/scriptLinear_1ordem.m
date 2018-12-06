% Script da parte linear com modelo de 1a ordem

% Os dados não linear devem ter sido obtidos com uma entrada de onda
% quadrada
load dadosnaolinear;

t = dados(1,:)'; % Tempo das amostras
w = dados(2,:)'; % Velocidade de saída
u = dados(3,:)'; % Saída da parte não-linear
v = dados(4,:)'; % Entrada do sistema geral

tamanho = length(t); % Quantidade de amostras

w1 = w;
w1(1) = [];

w0 = w;
w0(tamanho) = [];

u1 = u;
u1(1) = [];

A = [w0(:) u1(:)];
Y = w1;
theta = [(inv(A'*A))*A'*Y];

a = theta(1);
b = theta(2);

T = 0.002; %tempo entre duas amostras

tau = a*T/(1-a);
Km = b/(1-a);

G1 = tf([0 Km], [tau 1]);

%%Ys1 = lsim(G1, u, t);
figure; plot(t, Ys1); % Grafico que indica a resposta da FT