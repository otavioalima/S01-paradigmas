#include <iostream>
#include <iomanip>
#include <cmath>


using namespace std;

int main() {
    int quantidadeNotas;

    cout << "Digite a quantidade de notas que deseja inserir: ";
    cin >> quantidadeNotas;

    // Impede a continuacao do code se o usuario digitar 0 ou um numero negativo
    if (quantidadeNotas <= 0) {
        cout << "Quantidade invalida. O programa nao pode continuar." << endl;
        return 1;
    }

    double somaDasNotas = 0.0;
    double notaAtual;

    for (int i = 0; i < quantidadeNotas; ++i) {
        
        cout << "\nDigite a nota " << (i + 1) << ": ";
        cin >> notaAtual;

        // Garante que a nota inserida esteja sempre entre 0 e 10
        while (notaAtual < 0 || notaAtual > 10) {
            cout << "Nota invalida! Por favor, digite um valor entre 0 e 10: ";
            cin >> notaAtual;
        }

        somaDasNotas += notaAtual;
    }

    double media = somaDasNotas / quantidadeNotas;

    
    cout << fixed << setprecision(2);

    cout << "\nA media final do aluno e: " << media << endl;

    if (media >= 7.0) {
        cout << "Situacao: Aprovado" << endl;
    } else {
        cout << "Situacao: Reprovado" << endl;
    }
    
    return 0;
}