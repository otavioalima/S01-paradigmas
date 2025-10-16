from abc import ABC, abstractmethod

# Classe base
class Heroi(ABC):
    def __init__(self, nome, funcao):
        self.nome = nome
        self.funcao = funcao

    @abstractmethod
    def usar_ultimate(self):
        pass


# Classe filha Tanque
class Tanque(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self):
        print(f"{self.nome} (Tanque) usou sua ultimate: escudo impenetravel!")


# Classe filha Dano
class Dano(Heroi):
    def __init__(self, nome):
        super().__init__(nome, "Dano")

    def usar_ultimate(self):
        print(f"{self.nome} (Dano) usou sua ultimate: rajada explosiva!")


# Execucao direta 
herois = [
    Tanque("Reinhardt"),
    Dano("Soldado 76")
]

for heroi in herois:
    heroi.usar_ultimate()
