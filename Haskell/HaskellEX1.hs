-- questao 1

type Nome = String
type Tipo = String
type Preco = Float

data Bebida = Bebida Nome Tipo Preco deriving (Show)

data Status = Aberto | Entregue | Cancelado deriving (Show, Eq)

data Pedido = Pedido [Bebida] Status deriving (Show)


-- calcula o total do pedido com taxa de entrega
valorTotalPedido :: Pedido -> Float
valorTotalPedido (Pedido _ Cancelado) = 0
valorTotalPedido (Pedido listaBebidas _) = 
    let somatorio = sum [p | Bebida _ _ p <- listaBebidas]
    in somatorio + 5.0


-- retorna a primeira bebida
primeiraBebida :: Pedido -> String
primeiraBebida (Pedido [] _) = "pedido vazio"
primeiraBebida (Pedido (Bebida n _ _ : resto) _) = n


-- exemplos
b1 = Bebida "Coca Cola" "Refrigerante" 7.0
b2 = Bebida "Suco Laranja" "Suco" 8.5
b3 = Bebida "Agua" "Agua" 3.0

pedido1 = Pedido [b1, b2, b3] Aberto
pedido2 = Pedido [b1] Cancelado
pedido3 = Pedido [b2, b3] Entregue


main = do
    putStrLn "pedido 1:"
    print (primeiraBebida pedido1)
    print (valorTotalPedido pedido1)
    
    putStrLn "\npedido 2:"
    print (valorTotalPedido pedido2)
    
    putStrLn "\npedido 3:"
    print (valorTotalPedido pedido3)
