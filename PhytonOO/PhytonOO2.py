from abc import ABC, abstractmethod

# modelo simples inspirado em Overwatch

class Heroi(ABC):
    def __init__(self, nome: str, funcao: str):
        self.nome = nome
        self.funcao = funcao  # Tanque, Dano, Suporte

    @abstractmethod
    def usar_ultimate(self) -> None:
        """Cada classe filha deve implementar sua propria acao de ultimate."""
        pass

    def __repr__(self) -> str:
        return f"{self.nome} ({self.funcao})"


class Tanque(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Tanque")

    def usar_ultimate(self) -> None:
        print(f"{self.nome} ativou uma barreira massiva e puxou o foco dos inimigos.")


class Dano(Heroi):
    def __init__(self, nome: str):
        super().__init__(nome, "Dano")

    def usar_ultimate(self) -> None:
        print(f"{self.nome} disparou uma rajada explosiva causando alto dano em area.")


herois: list[Heroi] = [
    Tanque("Reinhardt"),
    Dano("Tracer"),
    Tanque("Dva"),
    Dano("Pharah"),
]

for h in herois:
    print(h)
    h.usar_ultimate()
