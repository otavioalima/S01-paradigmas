#lang racket

; estrutura da ocorrencia
(define-struct ocorrencia (nome ritual nivel-medo agentes-enviados))

; funcao recursiva pra somar nivel de medo
(define (soma-medo-recursiva lista-ocorrencias)
  (if (empty? lista-ocorrencias)
      0
      (+ (ocorrencia-nivel-medo (first lista-ocorrencias))
         (soma-medo-recursiva (rest lista-ocorrencias)))))

; funcao principal que analisa as ocorrencias
(define (analise-final lista-ocorrencias)
  (let ([total (soma-medo-recursiva lista-ocorrencias)]
        [quantidade (length lista-ocorrencias)])
    (let ([media (/ total quantidade)])
      (map ocorrencia-nome
           (filter (lambda (oc)
                     (and (> (ocorrencia-agentes-enviados oc) 3)
                          (> (ocorrencia-nivel-medo oc) media)))
                   lista-ocorrencias)))))

; testando com algumas ocorrencias
(define oc1 (make-ocorrencia "Ritual na Mansão Sombria" "Invocação" 8 4))
(define oc2 (make-ocorrencia "Sussurros na Floresta" "Comunicação" 5 2))
(define oc3 (make-ocorrencia "Eco no Cemitério Antigo" "Canalização" 9 5))
(define oc4 (make-ocorrencia "Aparição no Farol" "Manifestação" 6 3))
(define oc5 (make-ocorrencia "Portais no Subterrâneo" "Abertura" 10 6))

(define lista-teste (list oc1 oc2 oc3 oc4 oc5))

(analise-final lista-teste)
