function [ret] = laff_norm2(x)
%LAFF_NORM2 Calcula o comprimento (magnitude, length) de um vetor
%   Esta função calcula a Norma-2 (o comprimento, magnitude, length) de um
%   vetor através da Distância Euclidiana.
%   Pré-requisito: a função LAFF_DOT

% Verifica de x é realmente um vetor e calcula a norma-2 usando o dot
% product calculado com a função laff_dot:
if (~isvector(x))
    ret = 'FAILED';
    return
else
    ret = sqrt(laff_dot(x, x))
end

% Retorna
return
end