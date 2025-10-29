// Classe Criatura 
class Criatura {
  constructor(nome, perigosa) {
    this.nome = nome;
    this.perigosa = perigosa;
  }
}

// Classe Diario 
class Diario {
  #autorSecreto; // Atributo privado

  constructor(autor) {
    this.#autorSecreto = autor;
    this.enigmas = new Map(); // Usa Map conforme requisito
    this.criaturasAvistadas = [];
  }

  getAutor() {
    return this.#autorSecreto;
  }

  adicionarEnigma(num, enigma) {
    this.enigmas.set(num, enigma);
  }

  // Método decodificar 
  decodificar(chave, num) {
    if (chave !== this.#autorSecreto) {
      return "ACESSO NEGADO";
    }
    if (!this.enigmas.has(num)) {
      return "ENIGMA INEXISTENTE";
    }
    return this.enigmas.get(num);
  }

  adicionarCriatura(criatura) {
    this.criaturasAvistadas.push(criatura);
  }
}

// Classe Personagem 
class Personagem {
  constructor(nome, idade) {
    this.nome = nome;
    this.idade = idade;
  }
}

// Classe Protagonista 
class Protagonista extends Personagem {
  constructor(nome, idade, diario) {
    super(nome, idade);
    this.diario = diario;
  }
}

// Classe CabanaMisterio 
class CabanaMisterio {
  constructor(diario) {
    this.diario = diario;
    this.visitantes = [];
  }

  adicionarVisitante(nome) {
    this.visitantes.push(nome);
  }

  // Método listarFuncionarios retorna a coleção de Personagens
  listarFuncionarios() {
    return this.visitantes;
  }
}

//  DEMONSTRAÇÃO 
console.log("=== GRAVITY FALLS - DIARIO DO DIPPER ===\n");

// Criando o Diário
const diario = new Diario("Dipper Pines");
console.log(`Autor do Diário: ${diario.getAutor()}\n`);

// Adicionando enigmas usando Map
diario.adicionarEnigma(1, "Três letras estou eu usando, três letras estou dizendo, três letras estou usando...");
diario.adicionarEnigma(2, "BILL CIPHER É PERIGOSO!");
diario.adicionarEnigma(3, "O portal está sob a Cabana do Mistério");
console.log("✓ Enigmas adicionados ao Map");

// Adicionando criaturas avistadas
diario.adicionarCriatura(new Criatura("Gnomo", true));
diario.adicionarCriatura(new Criatura("Manotauro", true));
diario.adicionarCriatura(new Criatura("Unicórnio", false));
console.log(`✓ ${diario.criaturasAvistadas.length} criaturas registradas\n`);

// Criando Protagonista
const protagonista = new Protagonista("Dipper Pines", 12, diario);
console.log(`Protagonista: ${protagonista.nome}, ${protagonista.idade} anos`);

// Criando CabanaMisterio
const cabana = new CabanaMisterio(diario);

// Adicionando funcionários (Personagens)
cabana.adicionarVisitante("Stan Pines");
cabana.adicionarVisitante("Soos");
cabana.adicionarVisitante("Wendy");
console.log(`✓ Funcionários da Cabana: ${cabana.listarFuncionarios().join(", ")}\n`);

// Testando o método decodificar com validação de acesso
console.log("=== TESTANDO DECODIFICAÇÃO ===");
console.log(`Tentativa com chave errada: ${diario.decodificar("Bill Cipher", 1)}`);
console.log(`Tentativa com chave correta e enigma válido: ${diario.decodificar("Dipper Pines", 2)}`);
console.log(`Tentativa com enigma inexistente: ${diario.decodificar("Dipper Pines", 99)}\n`);

// Relatório final
console.log("=== RELATÓRIO FINAL ===");
console.log(`Total de enigmas: ${diario.enigmas.size}`);
console.log(`Total de criaturas: ${diario.criaturasAvistadas.length}`);
console.log("\nCriaturas perigosas:");
diario.criaturasAvistadas.forEach(c => {
  if (c.perigosa) {
    console.log(`  - ${c.nome}`);
  }
});
