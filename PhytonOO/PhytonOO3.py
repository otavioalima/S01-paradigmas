# Classe de Composicao
class ArmaCorpoACorpo:
    def __init__(self, tipo):
        self.tipo = tipo

    def __str__(self):
        return f"Arma: {self.tipo}"


# Classe Agregada
class PhantomThieves:
    def __init__(self, nome, arma):
        self.nome = nome
        self.arma = arma

    def __str__(self):
        return f"Membro: {self.nome} | Arma: {self.arma}"


# Classe Principal (Joker)
class Joker:
    def __init__(self, membros):
        
        self.arma = ArmaCorpoACorpo("Faca")
       
        self.membros = membros

    # Metodo que mostra a equipe agregada
    def mostrar_equipe(self):
        print("Equipe dos Phantom Thieves")
        print(f"Joker (Lider) | {self.arma}")
        for membro in self.membros:
            print(membro)


# Execucao direta
membro1 = PhantomThieves("Skull", "Cano de ferro")
membro2 = PhantomThieves("Panther", "Chicote")
membro3 = PhantomThieves("Fox", "Katana")

equipe = [membro1, membro2, membro3]
joker = Joker(equipe)

joker.mostrar_equipe()
