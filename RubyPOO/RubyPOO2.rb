# Classe base para musicos
class Musico
  attr_reader :nome, :instrumento

  def initialize(nome, instrumento)
    @nome = nome
    @instrumento = instrumento
  end

  def tocar_partitura(peca)
    raise NotImplementedError, "#{self.class} deve implementar #tocar_partitura"
  end

  def focar(estado)
    "#{nome} agora está #{estado}!"
  end
end

# Classe pianista
class Pianista < Musico
  def initialize(nome)
    super(nome, "Piano")
  end

  # Tocar
  def tocar_partitura(peca)
    "#{nome} (#{instrumento}) toca arpejos em \"#{peca}\"."
  end
end

# Classe violinista
class Violinista < Musico
  def initialize(nome)
    super(nome, "Violino")
  end

  # tocar
  def tocar_partitura(peca)
    "#{nome} (#{instrumento}) toca com vibrato em \"#{peca}\"."
  end
end

# Classe maestro
class Maestro
  attr_reader :musicos

  def initialize(musicos = [])
    @musicos = musicos
  end

  def adicionar_musico(musico)
    @musicos << musico
  end

  def iniciar_ensaio(peca)
    puts "== Ensaio: \"#{peca}\" =="
    musicos.each { |m| puts m.tocar_partitura(peca) }
  end

  def mudar_foco(estado)
    e = estado.to_s.strip.capitalize
    musicos.map { |m| m.focar(e) }
  end
end

if $PROGRAM_NAME == __FILE__
  lista = [Pianista.new("Kousei"), Violinista.new("Kaori"), Violinista.new("Takeshi")]
  maestro = Maestro.new(lista)

  print "Peça: "
  peca = STDIN.gets&.chomp
  peca = "Clair de Lune" if peca.nil? || peca.empty?

  puts
  maestro.mudar_foco("concentrado").each { |msg| puts msg }
  puts
  maestro.iniciar_ensaio(peca)
end
