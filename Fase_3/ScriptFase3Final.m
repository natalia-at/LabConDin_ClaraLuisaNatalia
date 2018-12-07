% Fase 3

clear all

% Função de transferência do modelo de posição
G = tf([181.1], [1 0.161 0]);

% Matrizes Espaco de Estados
A = [ 0 1 ; 0 0.161];
B = [ 0 ; 1 ];
C = [ 181.1 0 ];

% Cálculo de Ke (modelo de espaço de estados extendido)
Ae = [ 0 1 0 ; 0 0.161 0 ; -181.1 0 0 ];
Be = [ 0 ; 1 ; 0 ];
% Pd1 = -2;
% Pd2 = -7;
% Pd3 = -6;
Pd1 = -2;
Pd2 = -15;
Pd3 = -15;
Pd = [Pd1 Pd2 Pd3]; %vetor de polos desejados
Ke = acker(Ae, Be, Pd);
K = [Ke(1) Ke(2)];
Ki = [Ke(3)];

% Modelo do observador (cálculo do ganho L)
At = A';
Ct = C';
% Po1 = -22;
% Po2 = -25;
Po1 = -40;
Po2 = -40;
Po = [Po1 Po2]; %polos do observador (mais rápidos que os desejados do sistema)
L = acker(At, Ct, Po)';
