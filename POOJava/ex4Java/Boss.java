import java.util.LinkedHashSet;

// Classe Boss
public class Boss {
    private String nome;
    private String idBoss;
    private String pontoFraco;
    private LinkedHashSet<PadraoAtaque> _moveset; 
    
    public Boss(String nome, String id, String fracoContra) {
        this.nome = nome;
        this.idBoss = id;
        this.pontoFraco = fracoContra;
        this._moveset = new LinkedHashSet<>();
    }
    
    public String getNome() {
        return nome;
    }
    
    public String getIdBoss() {
        return idBoss;
    }
    
    public String getPontoFraco() {
        return pontoFraco;
    }
    
    public LinkedHashSet<PadraoAtaque> getMoveset() {
        return _moveset;
    }
    
    // Construtor:(nome, id, fracoContra)
    public void adicionarAtaque(PadraoAtaque ataque) {
        _moveset.add(ataque);
    }
    
    public void iniciarFase() {
        System.out.println("Boss " + nome + " (ID: " + idBoss + ") iniciou a fase!");
        System.out.println("Ponto Fraco: " + pontoFraco);
        System.out.println("Ataques disponíveis:");
        for (PadraoAtaque ataque : _moveset) {
            System.out.println("  - " + ataque.getNome() + " (Dano: " + ataque.getDano() + ")");
        }
    }
}
