clear all;
close all;

% Os dados não linear devem ter sido obtidos com uma entrada de onda
% triangular

load dadosnaolinear1.mat;

t = dadosnaolinear(1,:)'; % Tempo das amostras
w = dadosnaolinear(2,:)'; % Velocidade de saída
v = dadosnaolinear(4,:)'; % Entrada do sistema geral (Onda triangular com
                          % amplitude 2V e periodo 6s)
                          
figure, plot(t,v);        % Grafico velocidade do carrinho
figure, plot(t,w);        % Grafico sinal de entrada

tamanho = length(t); % Quantidade de amostras

delta1 = 0;
a = 0;
b = 2;
c = 2;
d = 2;
comecaP = 0;
comecaN = 0;
deltaPf = 0;
deltaNf = 0;


for i = 1:tamanho
  if (w(i,1) ~= 0)
      delta1 = w(i,1);
      start(1,1) = i;
     break;
  end
end

if(w(i+20,1) > w(i,1))
    deltaP(1,1) = delta1;
    for i = start(1,1):tamanho
        if (w(i,1) < 0)
            deltaN(1,1) = w(i,1);
            comecaP =1;
            start(2,1) = i;
        break;
        end
    end
else
    deltaN(1,1) = delta1;
    for i = start(1,1):tamanho
        if (w(i,1) > 0)
            deltaP(1,1) = w(i,1);
            comecaN = 1;
            start(2,1) = i;
        break;
        end
    end
end

while (a <= tamanho)
    if (comecaP > 0)
        for i = start(b,1):tamanho
            if (w(i,1) > 0)
                deltaP(c,1) = w(i,1);
                b = b+1;
                c = c+1;
                start(b,1) = i;
                comecaP = 0;
                comecaN = 1;
                break;
            end
        end
    elseif (comecaN > 0)
        for i = start(b,1):tamanho
            if (w(i,1) < 0)
                deltaN(d,1) = w(i,1);
                d = d+1;
                b = b+1;
                start(b,1) = i;
                comecaP = 1;
                comecaN = 0;
                break;
            end
        end
    end
    inter = start(b,1) - start(b-1,1)
    a = start(b,1) + inter;
end

tamanhoP = length(deltaP);

for i = 1:tamanhoP
    deltaPf = deltaPf + deltaP(i,1);
end

deltaPf = deltaPf/tamanhoP

tamanhoN = length(deltaN);

for i = 1:tamanhoN
    deltaNf = deltaNf + deltaN(i,1);
end

deltaNf = deltaNf/tamanhoN