#include <iostream>
#include <string>

using namespace std;

// Classe base para todos os seres
class SerVivo {
protected:
    string nome;

public:
    // Construtor
    SerVivo(const string& p_nome) : nome(p_nome) {}

    // Destrutor virtual para desalocacao correta
    virtual ~SerVivo() = default;

    // Metodo de apresentacao (polimorfico)
    virtual void apresentar() const {
        cout << "Um ser vivo genérico chamado " << nome << "." << endl;
    }
};

// Classe para a raca Humano
class Humano : public SerVivo {
public:
    // Construtor
    Humano(const string& p_nome) : SerVivo(p_nome) {}

    // Apresentacao especifica da raca
    void apresentar() const override {
        cout << "Olá! Sou um Humano e meu nome é " << nome << "." << endl;
    }
};

// Classe para a raca Elfo
class Elfo : public SerVivo {
public:
    // Construtor
    Elfo(const string& p_nome) : SerVivo(p_nome) {}

    // Apresentacao especifica da raca
    void apresentar() const override {
        cout << "Saudações. Sou um Elfo conhecido como " << nome << "." << endl;
    }
};

// Classe para a raca Fada
class Fada : public SerVivo {
public:
    // Construtor
    Fada(const string& p_nome) : SerVivo(p_nome) {}

    // Apresentacao especifica da raca
    void apresentar() const override {
        cout << "Brilho e magia! Eu sou a fada " << nome << "!" << endl;
    }
};

int main() {
    const int NUM_SERES = 3;
    // Vetor para guardar os seres
    SerVivo* lista_de_seres[NUM_SERES];

    // Cria e guarda cada um na lista
    lista_de_seres[0] = new Humano("Otavio");
    lista_de_seres[1] = new Elfo("Legolas");
    lista_de_seres[2] = new Fada("Sininho");
    
    cout << "Apresentando todos os seres vivos:" << endl;

    // Pede pra cada um se apresentar
    for (int i = 0; i i < NUM_SERES; ++i) {
        lista_de_seres[i]->apresentar();
    }

    // Limpa a memória no final
    for (int i = 0; i < NUM_SERES; ++i) {
        delete lista_de_seres[i];
    }

    return 0;
}