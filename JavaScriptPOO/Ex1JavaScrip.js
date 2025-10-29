// ===== Classe base =====
class Pokemon {
  #vida; // privado

  constructor(nome, tipo, vidaInicial = 100) {
    if (!nome || !tipo) throw new Error("nome e tipo são obrigatórios");
    if (Number.isNaN(Number(vidaInicial)) || vidaInicial <= 0)
      throw new Error("vidaInicial deve ser > 0");

    this._nome = String(nome);
    this._tipo = String(tipo);
    this.#vida = Math.floor(vidaInicial);
  }

  get nome() { return this._nome; }
  get tipo() { return this._tipo; }
  getVida() { return this.#vida; }
  isVivo() { return this.#vida > 0; }

  #ajustarVida(delta) {
    this.#vida = Math.max(0, this.#vida + delta);
  }
  receberDano(dano) {
    const d = Math.max(0, Number(dano) || 0);
    this.#ajustarVida(-d);
    return this.getVida();
  }
  curar(qtd) {
    const h = Math.max(0, Number(qtd) || 0);
    this.#ajustarVida(h);
    return this.getVida();
  }

  atacar(alvo) {
    if (!(alvo instanceof Pokemon)) throw new Error("alvo inválido");
    const dano = 10;
    alvo.receberDano(dano);
    console.log(`${this.nome} (GEN) causou ${dano} de dano em ${alvo.nome}.`);
  }
}

// Subclasse: Fogo 
class PokemonFogo extends Pokemon {
  constructor(nome, vidaInicial, bonusAtaque = 0) {
    super(nome, "Fogo", vidaInicial);
    this.bonusAtaque = Math.max(0, Number(bonusAtaque) || 0);
  }

  atacar(alvo) {
    if (!(alvo instanceof Pokemon)) throw new Error("alvo inválido");
    const dano = 12 + this.bonusAtaque;
    alvo.receberDano(dano);
    console.log(`${this.nome} (FOGO) queimou ${alvo.nome} causando ${dano}.`);
  }
}

//  Subclasse: Água 
class PokemonAgua extends Pokemon {
  constructor(nome, vidaInicial, curaBase = 0) {
    super(nome, "Água", vidaInicial);
    this.curaBase = Math.max(0, Number(curaBase) || 0);
  }

  atacar(alvo) {
    if (!(alvo instanceof Pokemon)) throw new Error("alvo inválido");
    const dano = 9;
    alvo.receberDano(dano);
    this.curar(this.curaBase);
    console.log(`${this.nome} (ÁGUA) atingiu ${alvo.nome} causando ${dano} e curou ${this.curaBase}.`);
  }
}

//  Demonstração rápida 
if (require.main === module) {
  const charmander = new PokemonFogo("Charmander", 60, 5);
  const squirtle   = new PokemonAgua("Squirtle", 70, 4);
  const magikarp   = new Pokemon("Magikarp", "Normal", 50);

  console.log("Vidas iniciais:",
    { Charmander: charmander.getVida(), Squirtle: squirtle.getVida(), Magikarp: magikarp.getVida() }
  );

  charmander.atacar(squirtle);   // 12 + 5
  squirtle.atacar(charmander);   // 9 + cura 4
  magikarp.atacar(charmander);   // 10 genérico

  console.log("Vidas após a troca:",
    { Charmander: charmander.getVida(), Squirtle: squirtle.getVida(), Magikarp: magikarp.getVida() }
  );
}

// Exporta classes para testes/import
module.exports = { Pokemon, PokemonFogo, PokemonAgua };
