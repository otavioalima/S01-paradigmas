// Calcula a media ponderada
fn calcular_media(nota1: f64, nota2: f64, nota3: f64) -> f64 {
    (nota1 * 2.0 + nota2 * 3.0 + nota3 * 5.0) / 10.0
}

fn main() {
    // Notas do aluno
    let nota1 = 7.5;
    let nota2 = 8.0;
    let nota3 = 9.2;

    // Calcula e exibe a media
    let media = calcular_media(nota1, nota2, nota3);
    println!("A media do aluno e: {:.2}", media);

    // Verifica a condicao de aprovacao
    if media >= 7.0 {
        println!("Resultado: Aprovado");
    } else {
        println!("Resultado: Reprovado");
    }
}
