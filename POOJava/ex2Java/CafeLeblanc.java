/** A cafeteria Leblanc, que possui um Menu */
public class CafeLeblanc {
    private final Menu _menu;

    public CafeLeblanc(Menu menu) {
        this._menu = menu;
    }

    /** Encaminha o café pedido para o menu (adição ao catálogo) */
    public void receberPedido(Cafe cafe) {
        _menu.adicionarItem(cafe);
    }

    public Menu getMenu() {
        return _menu;
    }
}
