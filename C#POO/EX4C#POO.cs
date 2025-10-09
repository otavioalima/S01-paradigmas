using System;

namespace HordaSombria
{
    //  Classe base abstrata
    public abstract class MonstroSombrio
    {
        public string Nome { get; private set; }

        protected MonstroSombrio(string nome)
        {
            Nome = nome;
        }

        // Metodo abstrato 
        public abstract void Mover();
    }

    //  Zumbi herda de MonstroSombrio
    public class Zumbi : MonstroSombrio
    {
        public Zumbi(string nome) : base(nome) {}

        //  Movimento lento do zumbi
        public override void Mover()
        {
            Console.WriteLine($"{Nome}: arrasta os pes lentamente pelo corredor. Velocidade: baixa");
        }
    }

    //  Espectro herda de MonstroSombrio
    public class Espectro : MonstroSombrio
    {
        public Espectro(string nome) : base(nome) {}

        // 3) Define deslocamento veloz
        public override void Mover()
        {
            Console.WriteLine($"{Nome}: atravessa paredes em um surto veloz. Velocidade: alta");
        }
    }

    public class Program
    {
        public static void Main(string[] args)
        {
            //  Classe mae
            MonstroSombrio[] horda = new MonstroSombrio[]
            {
                new Zumbi("Zeca Zumbi"),
                new Espectro("Sombra Antiga"),
                new Zumbi("Rastejante"),
                new Espectro("Vulto Etereo")
            };

            // Polimorfismo
            foreach (var monstro in horda)
            {
                monstro.Mover();
            }

            Console.WriteLine("Processamento da horda concluido.");
        }
    }
}
