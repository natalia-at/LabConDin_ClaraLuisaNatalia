% Fase 3

clear all

% Fun��o de transfer�ncia do modelo de posi��o
G = tf([181.1], [1 0.161 0]);

% Matrizes Espaco de Estados
A = [ 0 1 ; 0 0.161];
B = [ 0 ; 1 ];
C = [ 181.1 0 ];

% C�lculo de Ke (modelo de espa�o de estados extendido)
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

% Modelo do observador (c�lculo do ganho L)
At = A';
Ct = C';
% Po1 = -22;
% Po2 = -25;
Po1 = -40;
Po2 = -40;
Po = [Po1 Po2]; %polos do observador (mais r�pidos que os desejados do sistema)
L = acker(At, Ct, Po)';
