
# Classe base Drink
class Drink
  attr_reader :nome

  def initialize(nome, preco_base)
    @nome = nome
    self.preco_base = preco_base  
  end

  # Getter explicito
  def preco_base
    @_preco_base
  end

  # Setter explicito com validacao
  def preco_base=(valor)
    if valor > 0
      @_preco_base = valor
    else
      raise "O preço deve ser positivo!"
    end
  end

  # Metodo para clculo de preco final 
  def preco_final
    @_preco_base
  end

  # Metodo 
  def to_s
    "Drink: #{@nome} | Preço base: $#{@_preco_base}"
  end
end


# Subclasse DrinkLenda
class DrinkLenda < Drink
  def initialize(nome, preco_base, anos_desde_criacao)
    super(nome, preco_base)
    @_anos_desde_criacao = anos_desde_criacao
  end

  # Sobrescrita do metodo preco_final
  def preco_final
    @_preco_base + (5 * @_anos_desde_criacao)
  end

  # Sobrescrita do metodo 
  def to_s
    "Drink Lenda: #{@nome} | Preço base: $#{@_preco_base} | Anos: #{@_anos_desde_criacao} | Preço final: $#{preco_final}"
  end
end


# Programa principal
puts "Digite o nome do drink:"
nome = gets.chomp

puts "Digite o preço base:"
preco = gets.chomp.to_f

puts "Digite a idade do drink em anos:"
anos = gets.chomp.to_i

drink_lenda = DrinkLenda.new(nome, preco, anos)

puts "\n#{drink_lenda}"
