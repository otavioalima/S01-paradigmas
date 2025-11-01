import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/** Menu que agrega e gerencia uma lista de cafés  */
public class Menu {
    private final ArrayList<Cafe> items;

    public Menu(ArrayList<Cafe> items) {
        // Garante lista interna e preserva ordem de inserção
        this.items = (items != null) ? items : new ArrayList<>();
    }

    public void adicionarItem(Cafe cafe) {
        if (cafe != null) {
            items.add(cafe);
        }
    }

    public List<Cafe> getItens() {
        return Collections.unmodifiableList(items);
    }

    /** Exibe em ordem de inserção */
    public void exibirMenu() {
        System.out.println("=== MENU LEBLANC ===");
        for (int i = 0; i < items.size(); i++) {
            Cafe c = items.get(i);
            System.out.printf("%d) %-25s -> Preço final: R$ %.2f%n",
                    i + 1, c.getNome(), c.calcularPrecoFinal());
        }
    }
}
