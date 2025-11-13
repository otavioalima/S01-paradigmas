-- Casa de Banhos da Yubaba

data Servico = Servico 
  { nomeServico :: String
  , tipoServico :: String
  , precoBase :: Double
  } deriving (Show)

data Status = EmAndamento | Finalizado | Cancelado deriving (Show)

data Atendimento = Atendimento 
  { servicosAtend :: [Servico]
  , statusAtend :: Status
  } deriving (Show)

-- calcula o valor com bonus e desconto
bonusEspiritual :: [Servico] -> Double
bonusEspiritual servicos =
  let total = sum (map precoBase servicos)
      comBonus = if length servicos > 3 
                 then total * 1.25
                 else total
      final = if comBonus > 500
              then comBonus * 0.9
              else comBonus
  in final

valorFinalAtendimento :: Atendimento -> Double
valorFinalAtendimento (Atendimento servicos status)
  | status == Cancelado = 0
  | otherwise = bonusEspiritual servicos

descricaoPrimeiroServico :: Atendimento -> String
descricaoPrimeiroServico (Atendimento [] _) = "Nenhum serviço"
descricaoPrimeiroServico (Atendimento (primeiro:_) _) = 
  nomeServico primeiro ++ " - " ++ tipoServico primeiro

-- alguns servicos disponiveis
banhoSimples = Servico "Banho Simples" "Banho" 120
massagemRelax = Servico "Massagem Relaxante" "Massagem" 200
banqueteReal = Servico "Banquete Real" "Banquete" 300
saunaMistica = Servico "Sauna Mística" "Banho" 150

mostraAtendimento :: Atendimento -> IO ()
mostraAtendimento atend = do
  putStrLn "---"
  putStrLn ("Servico: " ++ descricaoPrimeiroServico atend)
  putStrLn ("Status: " ++ show (statusAtend atend))
  putStrLn ("Valor: R$ " ++ show (valorFinalAtendimento atend))

main = do
  let atend1 = Atendimento [banhoSimples, massagemRelax] EmAndamento
      atend2 = Atendimento [banhoSimples, massagemRelax, banqueteReal, saunaMistica] Finalizado
      atend3 = Atendimento [banqueteReal] Cancelado
  
  putStrLn "Atendimentos:"
  mostraAtendimento atend1
  mostraAtendimento atend2
  mostraAtendimento atend3
