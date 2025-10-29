// Ex2JavaScript.js
// POO com JavaScript - Esquadrão do Capitão Levi

// "Interface" IExplorador (simulada)
class IExplorador {
  explorarTerritorio() {
    throw new Error("Método explorarTerritorio() deve ser implementado.");
  }
}

// Componente: ODM_Gear
class ODM_Gear {
  constructor(modelo) {
    this.modelo = modelo;
    this.gasRestante = 100;
  }
  usarGas(quantidade) {
    if (quantidade <= this.gasRestante) {
      this.gasRestante -= quantidade;
      return `Usando ${quantidade} de gás. Restante: ${this.gasRestante}`;
    }
    return "Gás insuficiente!";
  }
  getGas() {
    return this.gasRestante;
  }
}

// Entidade: Soldado (implementa IExplorador)
class Soldado extends IExplorador {
  constructor(nome, modeloGear) {
    super();
    this.nome = nome;
    this.gear = new ODM_Gear(modeloGear);
  }
  explorarTerritorio() {
    this.gear.usarGas(10);
    return `${this.nome} está explorando o território com o modelo ${this.gear.modelo}.`;
  }
  verificarEquipamento() {
    return `Equipamento do soldado ${this.nome}: ${this.gear.modelo} | Gás restante: ${this.gear.getGas()}`;
  }
}

// Agregador: Esquadrao (também "implementa" IExplorador)
class Esquadrao extends IExplorador {
  constructor(lider, membrosIniciais = []) {
    super();
    this.lider = lider;
    this.membros = membrosIniciais;
  }
  adicionarMembro(soldado) {
    if (!(soldado instanceof Soldado)) {
      throw new Error("Apenas Soldado pode ser adicionado ao Esquadrão.");
    }
    this.membros.push(soldado);
  }
  explorarTerritorio() {
    return this.membros.map(s => s.explorarTerritorio());
  }
  relatarStatus() {
    return this.membros.map(s => s.verificarEquipamento());
  }
}

// ===== Demonstração (sem entrada; apenas saída no console) =====
const levi = new Soldado("Levi Ackerman", "Modelo A");
const mikasa = new Soldado("Mikasa Ackerman", "Modelo B");
const armin = new Soldado("Armin Arlert", "Modelo C");

const esquadraoLevi = new Esquadrao(levi, [mikasa]);
esquadraoLevi.adicionarMembro(armin);

console.log("=== Exploração ===");
console.log(esquadraoLevi.explorarTerritorio());

console.log("\\n=== Status ===");
console.log(esquadraoLevi.relatarStatus());

// Exporta classes para eventuais testes (opcional)
module.exports = { IExplorador, ODM_Gear, Soldado, Esquadrao };
