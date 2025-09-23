#include <iostream>
#include <string>
#include <limits>

using namespace std;

// Classe para representar um personagem
class Personagem {
private:
    string nome;
    int nivel;
    int dano;
    int vida;

public:
    // Construtor
    Personagem(string nomeInicial, int nivelInicial, int danoInicial, int vidaInicial) {
        nome = nomeInicial;
        nivel = nivelInicial;
        dano = danoInicial;
        vida = vidaInicial;
    }

    // Metodo de ataque
    void atacar(Personagem& alvo) {
        cout << this->nome << " ataca " << alvo.nome << "!" << endl;
        alvo.receberDano(this->dano);
    }

    // Controla o dano recebido
    void receberDano(int danoRecebido) {
        this->vida -= danoRecebido;
        if (this->vida < 0) {
            this->vida = 0;
        }
    }

    // Mostra o status atual
    void mostrarInfo() {
        cout << "\nStatus de " << this->nome << endl;
        cout << "Nivel: " << this->nivel << endl;
        cout << "Vida: " << this->vida << endl;
        cout << "Dano: " << this->dano << endl;
    }
};

int main() {
    string nome;
    int nivel, dano, vida;

    cout << "CRIACAO DO PERSONAGEM 1" << endl;
    cout << "Digite o nome: ";
    getline(cin, nome); 
    
    cout << "Digite o nivel: ";
    cin >> nivel;

    cout << "Digite o dano: ";
    cin >> dano;

    cout << "Digite a vida: ";
    cin >> vida;

    Personagem p1(nome, nivel, dano, vida);
    
    // Limpa o buffer de entrada antes de ler o proximo nome
    cin.ignore(numeric_limits<streamsize>::max(), '\n');

    cout << "\nCRIACAO DO PERSONAGEM 2" << endl;
    cout << "Digite o nome: ";
    getline(cin, nome);

    cout << "Digite o nivel: ";
    cin >> nivel;

    cout << "Digite o dano: ";
    cin >> dano;

    cout << "Digite a vida: ";
    cin >> vida;

    Personagem p2(nome, nivel, dano, vida);

    cout << "\nINICIO DO COMBATE" << endl;
    p1.mostrarInfo();
    p2.mostrarInfo();
    
    cout << "\nACAO" << endl;
    p1.atacar(p2);
    p2.atacar(p1);

    cout << "\nFIM DO COMBATE" << endl;
    p1.mostrarInfo();
    p2.mostrarInfo();

    return 0;
}