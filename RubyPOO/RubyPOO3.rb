# Classe da unidade do micro-ondas 
class MicroondasUnidade
  def initialize
    @calor = 0
  end

  # Simula aquecimento por alguns segundos
  def aquecer_por(segundos)
    @calor += segundos.to_i
  end
end

# Classe da mensagem DMail 
class DMail
  attr_reader :conteudo, :hora_envio

  def initialize(conteudo, hora_envio)
    @conteudo = conteudo
    @hora_envio = hora_envio
  end

  def to_s
    "[#{@hora_envio}] #{@conteudo}"
  end
end

# Classe principal que une tudo
class TelefoneDeMicroondas
  def initialize
    @unidade = MicroondasUnidade.new
    @dmails = []
  end

  # Le conteudo e hora, aquece e cria DMail
  def enviar_dmail
    puts "Conteúdo do D-Mail:"
    conteudo = gets.chomp
    puts "Hora de envio (ex: 10:30):"
    hora_envio = gets.chomp

    @unidade.aquecer_por(5)
    novo = DMail.new(conteudo, hora_envio)
    @dmails << novo
    puts "D-Mail enviado!"
  end

  # Lista D-Mails com hora posterior ao corte
  def listar_dmails(horario_corte)
    
    corte_min = horario_corte.split(':').map(&:to_i).then { |h, m| h * 60 + m }
    filtrados = @dmails.select do |m|
      h, mnt = m.hora_envio.split(':').map(&:to_i)
      (h * 60 + mnt) > corte_min
    end
    filtrados.each { |m| puts m }
  end
end

if __FILE__ == $0
  telefone = TelefoneDeMicroondas.new
  telefone.enviar_dmail
  puts "Digite horário de corte para listar (ex: 09:00):"
  corte = STDIN.gets.chomp
  telefone.listar_dmails(corte)
end
