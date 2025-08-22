30 REM Solicita a entrada do usuário
40 INPUT "Digite a temperatura em graus Celsius: ";
C

50 REM Converte Celsius para Kelvin
60 K = C + 273.15

70 REM Converte Celsius para Fahrenheit
80 F = (C * 9 / 5) + 32

90 REM Exibe os três valores na tela
100 PRINT
110 PRINT "Temperatura em Celsius: ";
C; " C"
120 PRINT "Temperatura em Kelvin: "; K; " K"
130 PRINT "Temperatura em Fahrenheit: "; F; " F"

140 END