function [ret] = laff_copy(x, y)
%LAFF_COPY Copia um vetor X para o vetor Y
%   Esta função faz a cópia de um vetor para outro vetor. O primeiro
%   argumento é o vetor de origem X (a ser copia), e o segundo argumento é
%   o vetor de destino Y (o que receberá a cópia).

% Tamanho dos vetores
[ xLinhas, xColunas ] = size(x);
[ yLinhas, yColunas ] = size(y);

% Verifica se x e y são realmente vetores e se são do mesmo tamanho (aqui
% não importa se são row ou column vectors):
if (xLinhas ~= 1 & xColunas ~= 1)
    ret = 'ERRO: x não é vetor';
    return
elseif (yLinhas ~= 1 & yColunas ~= 1)
    ret = 'ERRO: y não é vetor';
    return
elseif (xLinhas * xColunas ~= yLinhas * yColunas)
    ret = 'ERRO: x e y sao vetores de tamanhos diferentes';
    return
end

% Copia o vetor x no vetor y:
if (xColunas == 1) % Vetor x é column vector
    if (yColunas == 1) % Vetor y é column vector
        for i = 1:xLinhas
            y(i, 1) = x(i, 1);
        end
    else % Vetor y é row vector
        for i = 1:xLinhas
            y(1, i) = x(i, 1);
        end
    end
else % Vetor x é row vector
    if (yLinhas == 1) % Vetor y é row vector
        for i = 1:xColunas
            y(1, i) = x(1, i);
        end
    else % Vetor x é column vector
        for i = 1:xColunas
            y(i, 1) = x(1, i);
        end
    end
end

% Atribui saída
ret = y;

% Retorna
return
end