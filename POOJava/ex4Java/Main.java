import java.util.Scanner;

//  Sistema de Batalha de Bosses (Arena)
public class Main {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        
        Batalha arena = new Batalha();
        
        // Lê o número de bosses
        int numBosses = sc.nextInt();
        sc.nextLine(); 
        
        for (int i = 0; i < numBosses; i++) {
            String tipoBoss = sc.next();
            
            if (tipoBoss.equals("Normal")) {
                String nome = sc.next();
                String idBoss = sc.next();
                String pontoFraco = sc.next();
                int numAtaques = sc.nextInt();
                
                Boss boss = new Boss(nome, idBoss, pontoFraco);
                
                for (int j = 0; j < numAtaques; j++) {
                    String nomeAtaque = sc.next();
                    int dano = sc.nextInt();
                    boss.adicionarAtaque(new PadraoAtaque(nomeAtaque, dano));
                }
                
                arena.adicionarBoss(boss);
                
            } else if (tipoBoss.equals("Magico")) {
                String nome = sc.next();
                String idBoss = sc.next();
                String pontoFraco = sc.next();
                int numAtaques = sc.nextInt();
                
                BossMagico bossMagico = new BossMagico(nome, idBoss, pontoFraco);
                
                for (int j = 0; j < numAtaques; j++) {
                    String nomeAtaque = sc.next();
                    int dano = sc.nextInt();
                    bossMagico.adicionarAtaque(new PadraoAtaque(nomeAtaque, dano));
                }
                
                bossMagico.iniciarFase();
                arena.adicionarBoss(bossMagico);
            }
        }
        
        // Iniciar batalhas
        String idBatalha = sc.next();
        arena.iniciarBatalha(idBatalha);
        
        sc.close();
    }
}
