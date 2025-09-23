#include <iostream>
#include <string>

using namespace std;

// Classe base para os personagens
class Pessoa {
private:
    string nome;
    int idade;

public:
    // Construtor
    Pessoa(const string& p_nome, int p_idade) : nome(p_nome), idade(p_idade) {}

    // Metodo para obter o nome
    string getNome() const {
        return nome;
    }

    // Metodo para obter a idade
    int getIdade() const {
        return idade;
    }
};

// Classe que representa o protagonista do jogo
class Protagonista : public Pessoa {
private:
    int nivel;

public:
    // Construtor da classe
    Protagonista(const string& p_nome, int p_nivel) : Pessoa(p_nome, 0), nivel(p_nivel) {}

    // Retorna o nivel do protagonista
    int getNivel() const {
        return nivel;
    }
};

// Classe para os demais personagens (aliados)
class Personagem : public Pessoa {
private:
    int rank;

public:
    // Construtor da classe
    Personagem(const string& p_nome, int p_rank) : Pessoa(p_nome, 0) {
        // Garante que o rank esteja dentro do limite (0-10)
        if (p_rank >= 0 && p_rank <= 10) {
            this->rank = p_rank;
        } else {
            this->rank = 0; // Valor padrao
        }
    }

    // Retorna o rank do personagem
    int getRank() const {
        return rank;
    }
};

// Funcao principal
int main() {
    // Cria um objeto para o protagonista
    Protagonista protagonista("Joker", 99);

    // Cria um objeto para um personagem aliado
    Personagem personagem("Makoto Niijima", 10);

    // Imprime os valores dos objetos na tela
    cout << "Dados do Protagonista" << endl;
    cout << "Nome: " << protagonista.getNome() << endl;
    cout << "Nivel: " << protagonista.getNivel() << endl;
    cout << endl;

    cout << "Dados do Personagem (Aliado)" << endl;
    cout << "Nome: " << personagem.getNome() << endl;
    cout << "Rank (Social Link): " << personagem.getRank() << endl;
    cout << endl;

    return 0;
}