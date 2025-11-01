import java.util.HashMap;

public class Registros {
    private String nomeEquipe;
    private HashMap<Entidades, String> _avistamentos;

    public Registros(String nomeEquipe) {
        this.nomeEquipe = nomeEquipe;
        this._avistamentos = new HashMap<>();
    }

    public boolean registrarAvistamento(Entidades entidade, String nome) {
        if (!_avistamentos.containsValue(nome)) {
            _avistamentos.put(entidade, nome);
            System.out.println("Avistamento registrado: " + entidade.obterCoordenadas());
            return true;
        } else {
            System.out.println("Entidade '" + nome + "' ja registrada!");
            return false;
        }
    }

    public void listarAvistamentos() {
        System.out.println("\nREGISTROS DA EQUIPE " + nomeEquipe.toUpperCase());
        for (Entidades e : _avistamentos.keySet()) {
            System.out.println(" - " + e.obterCoordenadas());
        }
        System.out.println("Total de avistamentos: " + _avistamentos.size());
    }
}
