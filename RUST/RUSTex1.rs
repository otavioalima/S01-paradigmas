use std::io;

/// Verifica se a senha atende aos criterios de seguranca:

fn verificar_senha(senha: &str) -> bool {
    let comprimento_ok = senha.len() >= 8;
    let tem_numero = senha.chars().any(|c| c.is_digit(10));
    let tem_maiuscula = senha.chars().any(|c| c.is_ascii_uppercase());

    comprimento_ok && tem_numero && tem_maiuscula
}

fn main() {
    // Loop principal que solicita a senha ate que seja valida.
    loop {
        println!("Digite sua senha (minimo 8 caracteres, 1 numero, 1 maiuscula):");

        let mut input = String::new();

        io::stdin()
            .read_line(&mut input)
            .expect("Falha ao ler a linha.");

        // Remove espacos em branco e quebras de linha da entrada.
        let senha = input.trim();

        if verificar_senha(senha) {
            println!("Senha valida! Acesso concedido.");
            break; // Sai do loop se a senha for válida.
        } else {
            println!("\nSenha invalida. Tente novamente.\n");
        }
    }
}