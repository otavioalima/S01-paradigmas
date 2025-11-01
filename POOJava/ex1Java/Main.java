public class Main {
    public static void main(String[] args) {
        try {
            System.setOut(new java.io.PrintStream(System.out, true, "UTF-8"));
        } catch (java.io.UnsupportedEncodingException e) {
            
        }

        Mago howl = new Mago("Howl", 27, "Fogo Magico");

        Castelo castelo = new Castelo("Castelo Animado");

        Divisao cozinha = new Divisao("Cozinha");
        Divisao biblioteca = new Divisao("Biblioteca");
    Divisao salaFeiticos = new Divisao("Sala de Feiticos");

        castelo.adicionarDivisao(cozinha);
        castelo.adicionarDivisao(biblioteca);
        castelo.adicionarDivisao(salaFeiticos);

        System.out.println(howl.lancarFeitico());
        castelo.listarDivisoes();
    }
}