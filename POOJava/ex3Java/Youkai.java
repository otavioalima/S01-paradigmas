public class Youkai extends Entidades {

    public Youkai(String nome, String local, Poder poder) {
        super(nome, local, poder);
    }

    @Override
    public String obterCoordenadas() {
        return "Youkai [" + nome + "] localizado em: " + localizacao + " | Poder: " + poder.getNome();
    }
}
