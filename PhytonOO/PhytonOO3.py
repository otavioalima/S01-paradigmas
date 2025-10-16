# Classe de arma corpo a corpo
class ArmaCorpoACorpo:
    def __init__(self, tipo):
        self.tipo = tipo

    def __str__(self):
        return f"Arma: {self.tipo}"


# Classe de membro do grupo
class PhantomThieves:
    def __init__(self, nome, arma):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"Membro: {self.nome} | Arma: {self.arma}"


# Classe principal Joker
class Joker:
    def __init__(self, membros):
        # Cria e gerencia sua propria arma
        self.arma = ArmaCorpoACorpo("Faca")
        # Recebe os membros do grupo
        self.membros = membros

    # Mostra a equipe completa
    def mostrar_equipe(self):
        print("Equipe dos Phantom Thieves")
        print(f"Joker (Lider) | {self.arma}")
        for membro in self.membros:
            print(membro)


# Criacao dos membros do grupo
membro1 = PhantomThieves("Skull", "Cano de ferro")
membro2 = PhantomThieves("Panther", "Chicote")
membro3 = PhantomThieves("Fox", "Katana")

# Monta a equipe e exibe no final
equipe = [membro1, membro2, membro3]
joker = Joker(equipe)

joker.mostrar_equipe()
