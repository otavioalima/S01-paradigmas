
// "Interface" utilitária 
class IRastreavel {
  static is(obj) {
    return obj && typeof obj.rastrearLocal === "function";
  }
}

// Classe base
class Hunter {
  #nome;
  #idade;
  #localizacao;

  constructor(nome, local, idade) {
    if (!nome || typeof nome !== "string") {
      throw new Error("Nome inválido.");
    }
    this.#nome = nome.trim();
    this.#localizacao = String(local ?? "");
    this.#idade = typeof idade === "number" ? idade : undefined;
  }

  get nome() { return this.#nome; }
  get idade() { return this.#idade; }
  get localizacao() { return this.#localizacao; }
  set localizacao(valor) { this.#localizacao = String(valor ?? ""); }

  toString() {
    return `Hunter(${this.#nome}${this.#idade ? \`, ${this.#idade} anos\` : ""})`;
  }
}

// Especialista
class Especialista extends Hunter {
  #habilidadeNen;

  constructor(nome, habilidade) {
    super(nome, "", undefined);
    this.#habilidadeNen = String(habilidade ?? "");
  }

  get habilidadeNen() { return this.#habilidadeNen; }

  rastrearLocal(latitude, longitude) {
    this.localizacao = `${latitude},${longitude}`;
    return `${this.nome} (Especialista em ${this.habilidadeNen}) rastreou e fixou localização em ${this.localizacao}.`;
  }
}

// Manipulador
class Manipulador extends Hunter {
  #alvoAtual;

  constructor(nome) {
    super(nome, "", undefined);
    this.#alvoAtual = null;
  }

  get alvoAtual() { return this.#alvoAtual; }
  set alvoAtual(h) {
    if (h !== null && !(h instanceof Hunter)) {
      throw new Error("alvoAtual deve ser Hunter ou null.");
    }
    this.#alvoAtual = h;
  }

  rastrearLocal(latitude, longitude) {
    this.localizacao = `${latitude},${longitude}`;
    const alvoTxt = this.#alvoAtual ? ` (manipulando ${this.#alvoAtual.nome})` : "";
    return `${this.nome}${alvoTxt} rastreou e fixou localização em ${this.localizacao}.`;
  }
}

// Batalhão
class Batalhao {
  #hunters;

  constructor() {
    this.#hunters = new Set();
  }

  adicionarHunter(hunter) {
    if (!(hunter instanceof Hunter)) {
      throw new Error("Somente instâncias de Hunter podem ser adicionadas.");
    }
    for (const h of this.#hunters) {
      if (h.nome === hunter.nome) return false;
    }
    this.#hunters.add(hunter);
    return true;
  }

  getNumHunters() { return this.#hunters.size; }

  iniciarRastreamento(latitude, longitude) {
    const logs = [];
    for (const h of this.#hunters) {
      if (IRastreavel.is(h)) {
        logs.push(h.rastrearLocal(String(latitude), String(longitude)));
      }
    }
    return logs;
  }
}

// Exemplo de uso
const b = new Batalhao();
const e1 = new Especialista("Kurapika", "Correntes");
const m1 = new Manipulador("Illumi");
m1.alvoAtual = new Hunter("Gon", "", 14);
const e2 = new Especialista("Hisoka", "Bungee Gum");
const duplicado = new Especialista("Kurapika", "Outra Habilidade");

console.log("Add e1:", b.adicionarHunter(e1));
console.log("Add m1:", b.adicionarHunter(m1));
console.log("Add e2:", b.adicionarHunter(e2));
console.log("Add duplicado:", b.adicionarHunter(duplicado));
console.log("Qtd no batalhão:", b.getNumHunters());

const logs = b.iniciarRastreamento("-23.2237", "-45.9000");
console.log("Logs de rastreio:");
for (const l of logs) console.log(" -", l);
