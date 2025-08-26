-- EXERCÍCIO 4


function calculadora(num1, num2, operator)
    if operator == '+' then
        return num1 + num2
    elseif operator == '-' then
        return num1 - num2
    elseif operator == '*' then
        return num1 * num2
    elseif operator == '/' then
        if num2 == 0 then
            return "Erro: Divisão por zero."
        else
            return num1 / num2
        end
    else
        return "Erro: Operador inválido."
    end
end