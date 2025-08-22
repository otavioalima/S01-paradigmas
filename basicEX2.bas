' Inicia o gerador de números aleatórios
RANDOMIZE TIMER

' Limpa a tela
CLS

' Declaração das variáveis
DIM numeroSecreto AS INTEGER
DIM palpite AS INTEGER
DIM tentativas AS INTEGER

tentativas = 0

' Gera um número secreto entre 0 e 100
numeroSecreto = INT(RND * 101)

' Instrução inicial
PRINT "Adivinhe o número entre 0 e 100."
PRINT

' Inicia o loop do jogo
DO
    
    INPUT "Seu palpite: "; palpite
    tentativas = tentativas + 1

    
    IF palpite < numeroSecreto THEN
        PRINT "Maior."
    ELSEIF palpite > numeroSecreto THEN
        PRINT "Menor."
    END IF

LOOP WHILE palpite <> numeroSecreto

' Exibe o resultado final
PRINT
PRINT "Correto. O número era "; numeroSecreto; "."
PRINT "Você acertou em "; tentativas; " tentativas."


END