-- Exercício 2

-- Função para encontrar o maior número em uma tabela
function encontrarMaiorNumero(tabela)
    -- Se a tabela estiver vazia, retorna nil
    if #tabela == 0 then
        return nil
    end

    
    local maior = tabela[1]

    -- Percorre todos os elementos da tabela
    for _, valor in ipairs(tabela) do
        -- Compara o valor atual com o maior já encontrado
        if valor > maior then
            -- Se for maior, atualiza a variável
            maior = valor
        end
    end

    -- Retorna o maior valor
    return maior
end


-- Tabela de números para testar a função
local numeros = {10, 5, 25, 1, 30, 8, 17}

-- Chama a função com a tabela
local maior_valor = encontrarMaiorNumero(numeros)

-- Mostra o resultado
print("O maior valor na tabela é: " .. maior_valor)

-- Ex com uma tabela vazia
local tabela_vazia = {}
local resultado_vazio = encontrarMaiorNumero(tabela_vazia)

-- Mostra uma mensagem se o resultado estiver com tabela vazia
if resultado_vazio == nil then
    print("A tabela está vazia.")
end