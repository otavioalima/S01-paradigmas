# Modulo de rastreio
module Rastreavel
  attr_accessor :localizacao_atual

  def obter_localizacao(hora)
    "#{@nome} @ #{@localizacao_atual} (#{hora}h)"
  end
end

# Modulo de risco
module Perigoso
  def calcular_risco(hora)
    h = hora.to_i
    noite = (h >= 18 || h < 6) ? 2 : 1
    base = @periculosidade || 1
    base * noite
  end
end

# Base
class Participante
  include Rastreavel
  attr_reader :nome

  def initialize(nome, local = nil)
    @nome = nome
    @localizacao_atual = local
  end

  def to_s
    @nome
  end
end

# Detetive
class Detetive < Participante
  def investigar
    "#{@nome} investiga"
  end
end

# Vilao
class MestreDoCrime < Participante
  include Perigoso

  def initialize(nome, local = nil, periculosidade: 2)
    super(nome, local)
    @periculosidade = periculosidade
  end
end

# Cenario
class Cenario
  def initialize
    @participantes = []
  end

  def adicionar(*ps)
    @participantes.concat(ps)
  end

  # Lista rastreavel
  def rastreaveis
    @participantes.select { |p| p.respond_to?(:obter_localizacao) }
  end

  # Filtra criminosos
  def identificar_ameacas
    @participantes.select { |p| p.respond_to?(:calcular_risco) }
  end

  # Imprime alvos perigosos
  def imprimir_alvos(hora, risco_min = 2)
    perigosos = identificar_ameacas.select { |p| p.calcular_risco(hora) >= risco_min }
    perigosos.each_with_index do |p, i|
      puts "[#{i + 1}] #{p.nome} -> #{p.obter_localizacao(hora)} | risco: #{p.calcular_risco(hora)}"
    end
  end
end

# main
print 'Hora (0-23): '
hora = gets.to_i

print 'Local Sherlock: '
loc_s = gets.chomp

print 'Local Moriarty: '
loc_m = gets.chomp

sherlock = Detetive.new('Sherlock Holmes', loc_s)
moriarty = MestreDoCrime.new('Moriarty', loc_m, periculosidade: 3)

cenario = Cenario.new
cenario.adicionar(sherlock, moriarty)

puts "\nRastreio:"
cenario.rastreaveis.each { |p| puts p.obter_localizacao(hora) }

puts "\nAlvos perigosos:"
cenario.imprimir_alvos(hora, 2)
