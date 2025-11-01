public class Main {
    public static void main(String[] args) {
        System.out.println("SISTEMA DE REGISTRO DE ENTIDADES OCULTAS\n");
        
        // Criando poderes (Composicao para Youkai)
        Poder poderFogo = new Poder("Controle do Fogo");
        Poder poderGelo = new Poder("Manipulacao de Gelo");

        // Criando entidades
        // Youkai recebe Poder como parametro
        Youkai y1 = new Youkai("Kitsune", "Montanha Sombria", poderFogo);
        Youkai y2 = new Youkai("Yuki-Onna", "Vale Congelado", poderGelo);
        
        // Alien cria seu proprio Poder internamente (Composicao)
        Alien a1 = new Alien("Zorg", "Marte", "X-15");
        Alien a2 = new Alien("Xentari", "Andromeda", "Z-99");

        // Criando registro da equipe
        Registros equipe = new Registros("Detetives Ocultos");

        // Registrando entidades 
        System.out.println("\n--- Registrando Avistamentos ---");
        equipe.registrarAvistamento(y1, y1.getNome());
        equipe.registrarAvistamento(a1, a1.getNome());
        equipe.registrarAvistamento(y2, y2.getNome());
        equipe.registrarAvistamento(a2, a2.getNome());
        equipe.registrarAvistamento(y1, y1.getNome()); // Tentando registrar duplicado
        equipe.registrarAvistamento(a1, a1.getNome()); // Tentando registrar duplicado

        // Listando todos os registros
        equipe.listarAvistamentos();
    }
}
