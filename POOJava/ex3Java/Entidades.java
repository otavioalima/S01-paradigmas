// Classe  entidades
public abstract class Entidades implements IRastreavel {
    protected String nome;
    protected String localizacao;
    protected Poder poder;

    public Entidades(String nome, String localizacao, Poder poder) {
        this.nome = nome;
        this.localizacao = localizacao;
        this.poder = poder;
    }

    public String getNome() {
        return nome;
    }

    public abstract String obterCoordenadas();
}
