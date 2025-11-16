; Exercício 3 - Loja de Iwai

; estrutura do item
(defstruct item
  nome
  tipo
  preco
  forca-magica)

; catalogo com os itens da loja
(defparameter *catalogo*
  (list
   (make-item :nome "Espada Maldita" :tipo 'Arma :preco 100 :forca-magica 90)
   (make-item :nome "Arco Sombrio" :tipo 'Arma :preco 80 :forca-magica 75)
   (make-item :nome "Poção de Cura" :tipo 'Pocao :preco 30 :forca-magica 40)
   (make-item :nome "Poção de Mana" :tipo 'Pocao :preco 35 :forca-magica 60)
   (make-item :nome "Anel Amaldiçoado" :tipo 'Artefato :preco 120 :forca-magica 95)))

; adiciona 15% de imposto no preco
(defun adiciona-imposto (preco)
  (* preco 1.15))

; retorna a forca com bonus se for maior que 80
(defun bonus-maldicao (forca)
  (if (> forca 80)
      (* forca 1.5)
      forca))

; processa a venda das armas
(defun processa-venda (catalogo)
  (let* ((armas (remove-if-not (lambda (it) (eq (item-tipo it) 'Arma)) 
                               catalogo))
         (armas-com-imposto 
          (mapcar (lambda (it)
                    (make-item :nome (item-nome it)
                              :tipo (item-tipo it)
                              :preco (adiciona-imposto (item-preco it))
                              :forca-magica (item-forca-magica it)))
                  armas))
         (resultado 
          (mapcar (lambda (it)
                    (list (item-nome it)
                          (bonus-maldicao (item-forca-magica it))))
                  armas-com-imposto)))
    resultado))

; teste: (processa-venda *catalogo*)
