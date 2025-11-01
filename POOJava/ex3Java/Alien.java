public class Alien extends Entidades {
    private String planetaOrigem;
    private String ovni;

    public Alien(String nome, String planeta, String Ovni) {
        super(nome, "", null);  // Poder será criado por composição
        this.planetaOrigem = planeta;
        this.ovni = Ovni;
        // Composição: Alien cria seu próprio Poder
        this.poder = new Poder("Poder Alienígena");
    }

    @Override
    public String obterCoordenadas() {
        return "Alien [" + nome + "] do planeta " + planetaOrigem + " | OVNI: " + ovni + " | Poder: " + poder.getNome();
    }
}
