clear all;

% Os dados não linear devem ter sido obtidos com uma entrada de onda
% quadrada

load LinearData.mat;

t = data(1,:)'; % Tempo das amostras
w = data(2,:)'; % Velocidade de saída
u = data(4,:)'; % Saída da parte não-linear
v = data(5,:)'; % Entrada do sistema geral (Onda triangular de amplitude 

tamanho = length(t); % Quantidade de amostras

%linear_in = zeros(tamanho, 1);

%{
for k=1:tamanho
    if (u(k, 1) > deltaP)
        linear_in(k, 1) = u(k, 1) - deltaP;
    elseif (u(k, 1) < deltaN)
        linear_in(k, 1) = u(k, 1) - deltaN;
    else
        linear_in(k, 1) = 0;
    end
end
%}

% Aqui, o vetor coluna Y recebe os valores de amostras da velocidade de
% saída e é ajustado para o cálculo do sistema linear

w1 = w;
w1(tamanho) = [];
w1(1) = [];
Y = w1;

% Neste ponto, define-se e ajusta-se as colunas da matriz do sistema linear
w2 = w;
w2(1) = [];
w2(1) = [];

w0 = w;
w0(tamanho) = [];
w0(tamanho-1) = [];

u1 = u;
u1(tamanho) = [];
u1(1) = [];

A = [w2(:) w0(:) u1(:)]; % Matriz principal do sistema linear

theta = [(inv(A'*A))*A'*Y]; % Calculo de theta (vetor que se deseja obter)

a = theta(1);
b = theta(2);
c = theta(3);

T = 0.002; % Tempo entre duas amostras

% Cálculo dos coeficientes da função de transferência
K2 = (a-b)/(T*a);
K3 = (2*a - 1 - T*a*K2)/(T*T*a);
K1 = ((T*K2 + T*T*K3 - 2)*c)/(T*T);


% Simulação do modelo por meio dos parâmetros obtidos
G2 = tf([K1],[1 K2 K3]);

Ys2 = lsim(G2, u, t);
figure; plot(t,Ys2); % Grafico que indica a resposta da FT