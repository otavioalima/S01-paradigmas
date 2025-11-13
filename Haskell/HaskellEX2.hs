module Main where

-- definindo as categorias que um item pode ter
data Categoria = Arma | Pocao | Equipamento deriving (Show, Eq)

data Item = Item {
    nome :: String,
    categoria :: Categoria,
    preco :: Double
} deriving (Show)

-- estrutura pra representar uma compra
data CompraZelda = CompraZelda {
    cliente :: String,
    itensCompra :: [Item]
} deriving (Show)


-- soma o preco de todos os itens
totalItens :: [Item] -> Double
totalItens itens = sum (map preco itens)


-- aplica desconto de 10% se o total passar de 200
calculaDesconto :: [Item] -> Double
calculaDesconto itens = 
    let total = totalItens itens
    in if total > 200
       then total * 0.10
       else 0.0


-- calcula o valor que o cliente vai pagar no final
-- se passar de 200 ganha desconto, senao paga 15 de frete
valorFinal :: CompraZelda -> Double
valorFinal (CompraZelda _ itens)
    | total > 200 = total - desconto
    | otherwise = total + 15.0
    where
        total = totalItens itens
        desconto = calculaDesconto itens


-- criando alguns itens do jogo
espadaMaster = Item "Espada Master" Arma 150.0
escudoHyliano = Item "Escudo Hyliano" Equipamento 120.0
pocaoVida = Item "Pocao de Vida" Pocao 50.0

-- exemplos de compras pra testar
compraGrande = CompraZelda "Link" [espadaMaster, escudoHyliano]
compraPequena = CompraZelda "Link" [pocaoVida]


main :: IO ()
main = do
    putStrLn "Compra grande:"
    print compraGrande
    putStrLn $ "Valor final: " ++ show (valorFinal compraGrande)
    
    putStrLn ""
    
    putStrLn "Compra pequena:"
    print compraPequena
    putStrLn $ "Valor final: " ++ show (valorFinal compraPequena)