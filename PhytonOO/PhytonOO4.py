from abc import ABC, abstractmethod
from dataclasses import dataclass
from typing import List

# Cibernetico
class Cibernetico(ABC):
    @abstractmethod
    def realizar_hack(self) -> str:
        ...

# Implante
@dataclass(frozen=True)
class Implante:
    custo: float
    funcao: str

# NetRunner
class NetRunner(Cibernetico):
    def __init__(self, nome: str, implante: Implante) -> None:
        self.nome = nome
        self.implante = implante

    def realizar_hack(self) -> str:
        return f"{self.nome} hackeou usando '{self.implante.funcao}' (custo: {self.implante.custo:.2f})"

    def __repr__(self) -> str:
        return f"NetRunner(nome={self.nome!r}, implante={self.implante.funcao!r})"

# Faccao
class Faccao:
    def __init__(self, nome: str, membros: List[Cibernetico] | None = None) -> None:
        self.nome = nome
        self.membros: List[Cibernetico] = list(membros) if membros else []

    def adicionar(self, membro: Cibernetico) -> None:
        self.membros.append(membro)

    def mandar_todos_hackear(self) -> List[str]:
        return [m.realizar_hack() for m in self.membros]

# Instanciacao e execucao
implantes = [
    Implante(1200.0, "scanner optico Mk.II"),
    Implante(3500.0, "reflexos sinapticos"),
    Implante(2200.0, "interfaccia neural de braco"),
]

netrunners = [
    NetRunner("V", implantes[0]),
    NetRunner("Judy", implantes[1]),
    NetRunner("T-Bug", implantes[2]),
]

faccao = Faccao("Maelstrom", netrunners[:2])
faccao.adicionar(netrunners[2])

for rel in faccao.mandar_todos_hackear():
    print(rel)
