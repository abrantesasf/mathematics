function [ret] = laff_dot(x, y)
%LAFF_DOT Calcula o Dot Product dos vetores x e y
%   Esta função calcula o Dot Product (Inner Product) entre dois vetores de
%   mesmo tamanho, e retorna o resultado escalar.

% Tamanho dos vetores
[ xLinhas, xColunas ] = size(x);
[ yLinhas, yColunas ] = size(y);

% Verifica se x e y são realmente vetores e se são do mesmo tamanho (aqui
% não importa se são row ou column vectors):
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
end

% Variável para armazenar o resultado
resultado = 0

% Calcula o dot product:
if (xColunas == 1) % Vetor x é column vector
    if (yColunas == 1) % Vetor y é column vector
        for i = 1:yLinhas
            resultado = x(i,1) * y(i,1) + resultado
        end
    else % Vetor y é row vector
        for i = 1:yColunas
            resultado = x(i,1) * y(1,i) + resultado
        end
    end
else % Vetor x é row vector
    if (yLinhas == 1) % Vetor y é row vector
        for i = 1:yColunas
            resultado = x(1,i) * y(1,i) + resultado
        end
    else % Vetor y é column vector
        for i = 1:yLinhas
            resultado = x(1,i) * y(i,1) + resultado
        end
    end
end

% Atribui saída
ret = resultado;

% Retorna
return
end