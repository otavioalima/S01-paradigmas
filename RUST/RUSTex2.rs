use std::io;

/// Verifica se um numero (`i32`) e par
fn eh_par(numero: i32) -> bool {
    numero % 2 == 0
}

fn main() {
    println!("--- JOGO DO PAR OU IMPAR ---");
    
    // Captura a escolha do Jogador 1
    println!("Jogador 1, escolha 'par' ou 'impar':");
    let mut escolha_jogador1 = String::new();
    io::stdin()
        .read_line(&mut escolha_jogador1)
        .expect("Falha ao ler a escolha do Jogador 1.");

    // Normaliza a entrada para uma comparacao robusta 
    let escolha_jogador1 = escolha_jogador1.trim().to_lowercase();

    // Valida a escolha do Jogador 1 para garantir que seja 'par' ou 'impar'.
    if escolha_jogador1 != "par" && escolha_jogador1 != "impar" {
        println!("Escolha invalida! O jogo sera encerrado.");
        return; 
    }

    // Captura os numeros dos jogadores
    println!("Jogador 1, digite o seu numero:");
    let mut num_str_j1 = String::new();
    io::stdin()
        .read_line(&mut num_str_j1)
        .expect("Falha ao ler o numero do Jogador 1.");
    
    let numero_jogador1: i32 = num_str_j1
        .trim()
        .parse()
        .expect("Entrada invalida. Por favor, digite um numero inteiro.");

    println!("Jogador 2, digite o seu numero:");
    let mut num_str_j2 = String::new();
    io::stdin()
        .read_line(&mut num_str_j2)
        .expect("Falha ao ler o numero do Jogador 2.");

    let numero_jogador2: i32 = num_str_j2
        .trim()
        .parse()
        .expect("Entrada invalida. Por favor, digite um numero inteiro.");

    let soma = numero_jogador1 + numero_jogador2;
    let a_soma_eh_par = eh_par(soma);

    //  Jogador 1 vence se a paridade da soma corresponder a sua escolha
    let jogador1_venceu = (a_soma_eh_par && escolha_jogador1 == "par") || 
                          (!a_soma_eh_par && escolha_jogador1 == "impar");

    // Imprime o resultado final
    println!("\n--- RESULTADO DO JOGO ---");
    println!("Jogador 1 jogou {} e escolheu '{}'.", numero_jogador1, escolha_jogador1);
    println!("Jogador 2 jogou {}.", numero_jogador2);
    println!("A soma e: {} + {} = {}", numero_jogador1, numero_jogador2, soma);

    // Determina o texto do resultado (PAR/IMPAR) para uma impressao mais clara
    let resultado_texto = if a_soma_eh_par { "PAR" } else { "IMPAR" };
    println!("A soma resultou em um numero {}.", resultado_texto);

    if jogador1_venceu {
        println!("O Jogador 1 venceu!");
    } else {
        println!("O Jogador 2 venceu!");
    }
}