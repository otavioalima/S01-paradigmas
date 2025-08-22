10 REM PROGRAMA PARA CALCULAR O IMC
20 CLS

30 PRINT "CALCULO DE IMC "
40 PRINT

50 INPUT "Digite a sua altura (em metros): "; ALTURA
60 INPUT "Digite o seu peso (em quilogramas): "; PESO

70 REM FORMULA DO IMC: PESO / (ALTURA * ALTURA)
80 LET IMC = PESO / (ALTURA ^ 2)

90 PRINT
100 PRINT "O valor do seu IMC calculado e: "; IMC
110 END