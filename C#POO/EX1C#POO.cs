using System;

namespace SociedadeDoAnel
{
    //  Classe MembroDaSociedade
    public class MembroDaSociedade
    {
        //  Atributos privados
        private string nome;
        private string raca;
        private string funcao;

        //  Construtor 
        public MembroDaSociedade(string nome, string raca, string funcao)
        {
            this.nome = nome;
            this.raca = raca;
            this.funcao = funcao;
        }

        //  Metodo Descrever
        public void Descrever()
        {
            Console.WriteLine(" Membro da Sociedade do Anel ");
            Console.WriteLine($"Nome: {nome}");
            Console.WriteLine($"Raca: {raca}");
            Console.WriteLine($"Funcao: {funcao}");
            Console.WriteLine("-----------------------------------");
        }
    }

    // Classe principal 
    class Program
    {
        static void Main(string[] args)
        {
            // 5 Instancias de Aragorn e Legolas
            MembroDaSociedade aragorn = new MembroDaSociedade("Aragorn", "Humano", "Guardiao");
            MembroDaSociedade legolas = new MembroDaSociedade("Legolas", "Elfo", "Arqueiro");

            // Chamando o metodo 
            aragorn.Descrever();
            legolas.Descrever();

            Console.ReadKey();  
        }
    }
}
