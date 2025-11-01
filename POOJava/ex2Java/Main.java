import java.util.ArrayList;

public class Main {
    public static void main(String[] args) {
        //  Demonstração de uso 
        Menu menu = new Menu(new ArrayList<>());         // composição: Menu "possui" cafés
        CafeLeblanc leblanc = new CafeLeblanc(menu);     // composição: a cafeteria "possui" um menu

        // Criando cafés
        Cafe cafeBasico = new Cafe("Café Preto", 6.00);
        Cafe cappuccino = new Cafe("Cappuccino", 9.50);
        CafeGourmet premium = new CafeGourmet("Blue Mountain", 14.00, 3.50); // bônus de aroma

        // Recebendo pedidos 
        leblanc.receberPedido(cafeBasico);
        leblanc.receberPedido(cappuccino);
        leblanc.receberPedido(premium);

        // Exibindo o menu com preços finais
        leblanc.getMenu().exibirMenu();
    }
}
