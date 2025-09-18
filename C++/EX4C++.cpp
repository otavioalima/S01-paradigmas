#include <iostream>
#include <iomanip>
#include <cmath>

using namespace std;

// Converte a temperatura de Celsius para Fahrenheit.
double celsiusParaFahrenheit(double celsius) {
    return (celsius * 9.0 / 5.0) + 32;
}

// Converte a temperatura de Celsius para Kelvin.
double celsiusParaKelvin(double celsius) {
    return celsius + 273.15;
}

int main() {
    int opcao;

    // Loop principal para manter o menu interativo.
    do {
        cout << "\n-- Conversor de Temperatura --" << endl;
        cout << "1. Converter Celsius para Fahrenheit" << endl;
        cout << "2. Converter Celsius para Kelvin" << endl;
        cout << "3. Sair" << endl;
        cout << "Escolha uma opcao: ";
        cin >> opcao;

        double celsius;

        switch (opcao) {
            case 1:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                cout << fixed << setprecision(2);
                cout << "Resultado: " << celsius << " C e igual a " << celsiusParaFahrenheit(celsius) << " F." << endl;
                break;

            case 2:
                cout << "Digite a temperatura em Celsius: ";
                cin >> celsius;
                cout << fixed << setprecision(2);
                cout << "Resultado: " << celsius << " C e igual a " << celsiusParaKelvin(celsius) << " K." << endl;
                break;

            case 3:
                cout << "Saindo do programa. Ate mais!" << endl;
                break;

            default:
                cout << "Opcao invalida. Por favor, tente novamente." << endl;
                break;
        }

    } while (opcao != 3); // O programa termina quando o usuario escolhe 3.

    return 0;
}