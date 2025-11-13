-- ex3: controle de shows

data Status = Ativo | Encerrado | Cancelado deriving (Show, Eq)

data Banda = Banda { 
    nomeBanda :: String, 
    genero :: String, 
    cache :: Double 
} deriving (Show)

data Evento = Evento { 
    bandas :: [Banda], 
    statusEvento :: Status 
} deriving (Show)

-- pega o custo das bandas e adiciona 20% de taxa
custoTotalEvento :: Evento -> Double
custoTotalEvento (Evento _ Cancelado) = 0.0
custoTotalEvento (Evento bs _) = 
    let valor = sum [cache b | b <- bs]
    in valor * 1.20

-- primeira banda da lista
bandaAbertura :: Evento -> String
bandaAbertura (Evento [] _) = "sem banda"
bandaAbertura (Evento (b:_) _) = nomeBanda b

-- ultima banda da lista
bandaFechamento :: Evento -> String  
bandaFechamento (Evento [] _) = "sem banda"
bandaFechamento (Evento bs _) = nomeBanda (last bs)

-- alguns exemplos de bandas
banda1 = Banda "Os Raimundos" "Rock" 1500.0
banda2 = Banda "Jota Quest" "Pop Rock" 2000.0
banda3 = Banda "Charlie Brown Jr" "Rock" 1800.0

-- criando uns eventos pra testar
evento1 = Evento [banda1, banda2, banda3] Ativo
evento2 = Evento [banda2, banda3] Encerrado
evento3 = Evento [banda1] Cancelado

main = do
    putStrLn "evento1"
    print (custoTotalEvento evento1)
    putStrLn ("abre: " ++ bandaAbertura evento1)
    putStrLn ("fecha: " ++ bandaFechamento evento1)
    putStrLn ""
    
    putStrLn "evento2"
    print (custoTotalEvento evento2)
    putStrLn ("abre: " ++ bandaAbertura evento2)
    putStrLn ("fecha: " ++ bandaFechamento evento2)
    putStrLn ""
    
    putStrLn "evento3 (cancelado)"
    print (custoTotalEvento evento3)
    putStrLn ("abre: " ++ bandaAbertura evento3)
    putStrLn ("fecha: " ++ bandaFechamento evento3)
