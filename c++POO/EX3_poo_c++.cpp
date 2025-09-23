#include <iostream>
#include <string>

using namespace std;

// Classe base
class Pessoa {
protected:
    string nome;

public:
    Pessoa(const string& p_nome) : nome(p_nome) {}

    // Importante para evitar vazamento de memória com polimorfismo
    virtual ~Pessoa() {}

    virtual void apresentar() {
        cout << "Ola, meu nome e " << nome << " e eu sou uma pessoa." << endl;
    }
};

// Classe derivada
class Professor : public Pessoa {
private:
    string disciplina;

public:
    Professor(const string& p_nome, const string& p_disciplina)
        : Pessoa(p_nome), disciplina(p_disciplina) {}

    // Sobrescrita do método base 
    void apresentar() {
        cout << "Ola, meu nome e " << nome << " e eu sou um professor de " << disciplina << "." << endl;
    }
};

// Classe derivada
class Aluno : public Pessoa {
private:
    string curso;

public:
    Aluno(const string& p_nome, const string& p_curso)
        : Pessoa(p_nome), curso(p_curso) {}

    // Sobrescrita do método base 
    void apresentar() {
        cout << "Ola, meu nome e " << nome << " e eu sou um aluno de " << curso << "." << endl;
    }
};

int main() {
    // Criando o professor e o aluno
    Pessoa* ptr_pessoa1 = new Professor("Marcelo", "Engenharia de Software");
    Pessoa* ptr_pessoa2 = new Aluno("Otavio", "Engenharia de Computacao");

    cout << "Demonstracao de Polimorfismo" << endl;

    // Chamadas polimórficas
    ptr_pessoa1->apresentar();
    ptr_pessoa2->apresentar();

    // Liberação da memória
    delete ptr_pessoa1;
    delete ptr_pessoa2;

    return 0;
}