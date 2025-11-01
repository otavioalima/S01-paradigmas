// Classe BossMagico que estende Boss (Herança)
public class BossMagico extends Boss {
    
    public BossMagico(String nome, String id, String fracoContra) {
        super(nome, id, fracoContra);
    }
    
    @Override
    public void iniciarFase() {
        System.out.println("Boss Mágico " + getNome() + " (ID: " + getIdBoss() + ") invocou poderes ancestrais!");
        System.out.println("Ponto Fraco: " + getPontoFraco());
        System.out.println("Feitiços disponíveis:");
        for (PadraoAtaque ataque : getMoveset()) {
            System.out.println("  - " + ataque.getNome() + " (Dano Mágico: " + ataque.getDano() + ")");
        }
    }
}
