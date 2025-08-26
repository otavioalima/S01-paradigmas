-- EXERCÍCIO 3

-- Função que recebe uma tabela e retorna uma nova tabela apenas com os números pares
function filter_even_numbers(original_table)
    local even_numbers_table = {}

    for _, number in ipairs(original_table) do
        if number % 2 == 0 then
            table.insert(even_numbers_table, number)
        end
    end

    return even_numbers_table
end

-- Função auxiliar para imprimir uma tabela
function print_table(t)
    io.write("{ ")
    for i, v in ipairs(t) do
        io.write(v)
        if i < #t then
            io.write(", ")
        end
    end
    io.write(" }\n")
end

-- Exemplo de uso
local my_numbers = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15}

print("Tabela original:")
print_table(my_numbers)

local even_numbers = filter_even_numbers(my_numbers)

print("Tabela contendo apenas os números pares:")
print_table(even_numbers)