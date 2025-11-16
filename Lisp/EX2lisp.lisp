;;; Catalogo de Fauna - Planet 4546B
;;; Exercicio 2

;; estrutura para representar uma criatura
(defstruct criatura
  nome
  ambiente
  periculosidade
  vida-media)

;; catalogo com as criaturas do planeta
(defparameter *catalogo-inicial*
  (list
   (make-criatura :nome "Peixe Safe Shallows"
                  :ambiente "Safe Shallows"
                  :periculosidade "Baixa"
                  :vida-media 5)
   (make-criatura :nome "Reaper Leviathan"
                  :ambiente "Open Ocean"
                  :periculosidade "Alta"
                  :vida-media 50)
   (make-criatura :nome "Ghost Leviathan"
                  :ambiente "Deep"
                  :periculosidade "Alta"
                  :vida-media 80)
   (make-criatura :nome "Crab Squid"
                  :ambiente "Deep"
                  :periculosidade "Média"
                  :vida-media 30)))

;; remove criaturas com periculosidade baixa da lista
(defun filtra-por-perigo (catalogo)
  (remove-if (lambda (c)
               (string= (criatura-periculosidade c) "Baixa"))
             catalogo))

;; gera relatorio das criaturas que vivem em ambientes profundos
(defun relatorio-profundidade (catalogo)
  (let ((criaturas-deep (remove-if-not 
                         (lambda (c) 
                           (string= (criatura-ambiente c) "Deep"))
                         catalogo)))
    ;; mapeia cada criatura para uma string formatada
    (mapcar (lambda (c)
              (format nil "~A: Vive em ~A" 
                      (criatura-nome c) 
                      (criatura-ambiente c)))
            criaturas-deep)))
