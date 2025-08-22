10 REM Programa para calcular a media de um aluno
20 CLS

30 PRINT "Digite a primeira nota:"
40 INPUT NOTA1

50 PRINT "Digite a segunda nota:"
60 INPUT NOTA2

70 MEDIA = (NOTA1 + NOTA2) / 2
80 PRINT "Sua media inicial e: "; MEDIA

90 IF MEDIA > 60 THEN
100    PRINT "Aprovado direto"
110 ELSEIF MEDIA < 30 THEN
120    PRINT "Reprovado direto"
130 ELSE
140    PRINT "Voce esta de recuperacao (NP3). Digite a nota da NP3:"
150    INPUT NOTA3
160    NOVA_MEDIA = (MEDIA + NOTA3) / 2
170    PRINT "Sua nova media e: "; NOVA_MEDIA
180    IF NOVA_MEDIA > 50 THEN
190       PRINT "Aprovado pela NP3"
200    ELSE
210       PRINT "Reprovado na NP3"
220    END IF
230 END IF

240 END