/** Especialização de Café com bônus de aroma */
public class CafeGourmet extends Cafe {
    private double bonusAroma;

    public CafeGourmet(String nome, double precoBase, double bonusAroma) {
        super(nome, precoBase);
        this.bonusAroma = bonusAroma;
    }

    public double getBonusAroma() {
        return bonusAroma;
    }

    /** Soma um bônus de aroma ao preço final */
    @Override
    public double calcularPrecoFinal() {
        return precoBase + bonusAroma;
    }

    @Override
    public String toString() {
        return String.format("%s (base R$ %.2f + bônus aroma R$ %.2f)",
                nome, precoBase, bonusAroma);
    }
}
