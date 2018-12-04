function [ret] = laff_scal(alpha, x)
%LAFF_SCAL Realiza o scalling de um vetor
%   Esta função realiza o scalling de um vetor x qualquer multiplicando
%   esse vetor por um escalar alpha.

% Tamanho do vetor x
[ xLinhas, xColunas ] = size(x);

% Verifica se x é realmente um vetor e se alpha é realmente um escalar:
if (xLinhas ~= 1 & xColunas ~= 1)
    %ret = 'ERRO: x não é vetor';
    ret = 'FAILED';
    return
elseif (~isscalar(alpha))
    %ret = 'ERRO: alpha não é um escalar';
    ret = 'FAILED';
    return
end

% Faz o scalling:
if (xColunas == 1) % Vetor x é column vector
    for i = 1:xLinhas
        x(i, 1) = alpha * x(i, 1)
    end
else % Vetor x é row vector
    for i = 1:xColunas
        x(1, i) = alpha * x(1, i)
    end
end

% Atribui saída
ret = x;

% Retorna
return
end