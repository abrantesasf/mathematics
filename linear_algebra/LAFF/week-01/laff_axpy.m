function [ret] = laff_axpy(alpha, x, y)
%LAFF_AXPY Realiza uma Scaled Vector Adition, AXPY (a*x + y)
%   Esta função realiza uma scaled vector adition, AXPY, onde primeiro
%   realizamos o scalling do vetor x pelo escalar alpha, e depois somamos
%   esse vetor escalado com o vetor y.

% Tamanho dos vetores
[ xLinhas, xColunas ] = size(x);
[ yLinhas, yColunas ] = size(y);

% Verifica se x e y são realmente vetores e se são do mesmo tamanho (aqui
% não importa se são row ou column vectors). Também verifica se alpha é
% realmente um escalar.
if (xLinhas ~= 1 & xColunas ~= 1)
    %ret = 'ERRO: x não é vetor';
    ret = 'FAILED';
    return
elseif (yLinhas ~= 1 & yColunas ~= 1)
    %ret = 'ERRO: y não é vetor';
    ret = 'FAILED';
    return
elseif (xLinhas * xColunas ~= yLinhas * yColunas)
    %ret = 'ERRO: x e y sao vetores de tamanhos diferentes';
    ret = 'FAILED';
    return
elseif (~isscalar(alpha))
    %ret = 'ERRO: alpha não é um escalar'
    ret = 'FAILED';
    return
end

% Copia o vetor x no vetor y:
if (xColunas == 1) % Vetor x é column vector
    if (yColunas == 1) % Vetor y é column vector
        for i = 1:yLinhas
            y(i,1) = alpha * x(i,1) + y(i,1)
        end
    else % Vetor y é row vector
        for i = 1:yColunas
            y(1,i) = alpha * x(i,1) + y(1,i)
        end
    end
else % Vetor x é row vector
    if (yLinhas == 1) % Vetor y é row vector
        for i = 1:yColunas
            y(1,i) = alpha * x(1,i) + y(1,i)
        end
    else % Vetor x é column vector
        for i = 1:yLinhas
            y(i,1) = alpha * x(1,i) + y(i,1)
        end
    end
end

% Atribui saída
ret = y;

% Retorna
return
end