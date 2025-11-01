import java.util.HashMap;

// Classe Batalha 
public class Batalha {
    private HashMap<String, Boss> _arena; 
    
    // Construtor padrão
    public Batalha() {
        this._arena = new HashMap<>();
    }
    
    // Construtor arena
    public Batalha(HashMap<String, Boss> arena) {
        this._arena = arena;
    }
    
    public void adicionarBoss(Boss boss) {
        _arena.put(boss.getIdBoss(), boss);
    }
    
    public void iniciarBatalha(String idBoss) {
        // Usa o HashMap para localizar o Boss
        Boss boss = _arena.get(idBoss);
        
        if (boss != null) {
            System.out.println("\n=== BATALHA INICIADA ===");
            boss.iniciarFase();
        } else {
            System.out.println("Boss com ID " + idBoss + " não encontrado na arena!");
        }
    }
}
