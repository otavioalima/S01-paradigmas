; Exercício 1 - Sistema de dosagem da farmácia
; Programa que calcula a dose de remédio baseado no peso e idade do paciente

; Função pra determinar a dose certa
; Crianças pequenas (menos de 5 anos OU menos de 20kg) = 10ml
; Crianças maiores (5-12 anos com pelo menos 20kg) = 25ml  
; Resto = 50ml
(defun calcula-dosagem (peso idade)
  (cond
    ((or (< idade 5) (< peso 20)) 10)
    ((and (>= idade 5) (<= idade 12) (>= peso 20)) 25)
    (t 50)))

; Calcula o preço dependendo da erva usada
; Ginseng é caro (3x o preço)
; Lótus custa mais um pouco (1.5x)
; Outras ervas mantém o preço normal
(defun ajusta-preco (preco-base nome-erva)
  (cond
    ((string= nome-erva "Ginseng") 
     (* preco-base 3.0))
    ((string= nome-erva "Lótus") 
     (* preco-base 1.5))
    (t 
     preco-base)))

; Função principal que roda o exemplo
(defun calcular-caso-final ()
  (let* ((idade 14)
         (peso 60)
         (erva "Lótus")
         (preco-base 10)
         (dose (calcula-dosagem peso idade))
         (preco-final (ajusta-preco preco-base erva)))
    
    ; Imprime os resultados na tela
    (format t "~%========== Receita Médica ==========~%")
    (format t "Idade do paciente: ~A anos~%" idade)
    (format t "Peso: ~A kg~%" peso)
    (format t "Erva medicinal: ~A~%" erva)
    (format t "Dosagem: ~A ml~%" dose)
    (format t "Valor a pagar: ~A moedas~%" preco-final)
    (format t "====================================~%~%")))

; Executa o programa
(calcular-caso-final)
