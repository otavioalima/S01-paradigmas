-- Exercício 1

-- Solicita e lê o número inteiro M 
print("Digite o número inteiro M (início do intervalo):")
local m_input = io.read()
local M = tonumber(m_input)

--  Solicita e lê o número inteiro N 
print("Digite o número inteiro N (fim do intervalo):")
local n_input = io.read()
local N = tonumber(n_input)

--  Solicita e lê o número inteiro X (o qual queremos encontrar os múltiplos)
print("Digite o número inteiro X (o qual você quer encontrar os múltiplos):")
local x_input = io.read()
local X = tonumber(x_input)

-- Verifica se a conversão para número foi bem-sucedida
if M == nil or N == nil or X == nil then
    print("Erro: Entrada inválida. Por favor, digite números inteiros.")
    return
end

--  Exibe os múltiplos de X no intervalo de M a N
print("\nOs múltiplos de " .. X .. " no intervalo [" .. M .. ", " .. N .. "] são:")

-- Loop de M até N
for i = M, N do
    -- Usa o operador de módulo (%) para verificar se i é um múltiplo de X
    if i % X == 0 then
        -- Se o resto da divisão de i por X for 0, então i é um múltiplo
        print(i)
    end
end