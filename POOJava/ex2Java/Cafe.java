/** Classe b Café */
public class Cafe {
    protected String nome;
    protected double precoBase;

    public Cafe(String nome, double precoBase) {
        this.nome = nome;
        this.precoBase = precoBase;
    }

    /** Polimórfico */
    public double calcularPrecoFinal() {
        return precoBase;
    }

    public String getNome() {
        return nome;
    }

    public double getPrecoBase() {
        return precoBase;
    }

    @Override
    public String toString() {
        return String.format("%s (base R$ %.2f)", nome, precoBase);
    }
}
