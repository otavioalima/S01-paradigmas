use std::io;

/// Imprime a tabuada 
fn imprimir_tabuada(numero: i32, limite_inferior: i32, limite_superior: i32) {
    println!("\n--- Tabuada do {} de {} a {} ---", numero, limite_inferior, limite_superior);
    
    // Loop que percorre do limite inferior ate o superior 
    for contador in limite_inferior..=limite_superior {
        let resultado = numero * contador;
        println!("{} x {} = {}", numero, contador, resultado);
    }
}

fn main() {
    // Coleta dos dados de entrada do usuario

    // Le o numero base da tabuada
    println!("Digite o numero da tabuada:");
    let mut numero_str = String::new();
    io::stdin()
        .read_line(&mut numero_str)
        .expect("Falha ao ler a entrada");
    let numero: i32 = numero_str
        .trim()
        .parse()
        .expect("Por favor, digite um numero inteiro valido");

    // Le o limite inferior do intervalo
    println!("Digite o limite inferior:");
    let mut limite_inferior_str = String::new();
    io::stdin()
        .read_line(&mut limite_inferior_str)
        .expect("Falha ao ler a entrada");
    let limite_inferior: i32 = limite_inferior_str
        .trim()
        .parse()
        .expect("Por favor, digite um numero inteiro valido");

    // Le o limite superior do intervalo
    println!("Digite o limite superior:");
    let mut limite_superior_str = String::new();
    io::stdin()
        .read_line(&mut limite_superior_str)
        .expect("Falha ao ler a entrada");
    let limite_superior: i32 = limite_superior_str
        .trim()
        .parse()
        .expect("Por favor, digite um numero inteiro valido");

    // Chamada da funcao que imprime a tabuada 
    imprimir_tabuada(numero, limite_inferior, limite_superior);
}
