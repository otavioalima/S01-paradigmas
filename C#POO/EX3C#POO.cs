using System;
using System.Collections.Generic;

// Classe Feitico (Propriedades)
class Feitico
{
    public string Nome { get; set; }
    public string Elemento { get; set; }

    public Feitico(string nome, string elemento)
    {
        Nome = nome;
        Elemento = elemento;
    }

    public void MostrarFeitico()
    {
        Console.WriteLine($"Feitico: {Nome} - Elemento: {Elemento}");
    }
}

// Classe Grimorio (Composicao de Feiticos)
class Grimorio
{
    private List<Feitico> feiticos;

    public Grimorio()
    {
        feiticos = new List<Feitico>();
    }

    public void AdicionarFeitico(Feitico f)
    {
        feiticos.Add(f);
    }

    public void MostrarFeiticos()
    {
        Console.WriteLine("\nFeiticos do Grimorio:");
        foreach (Feitico f in feiticos)
        {
            f.MostrarFeitico();
        }
    }
}

// Classe Ferramenta (Agregacao)
class Ferramenta
{
    public string Nome { get; set; }

    public Ferramenta(string nome)
    {
        Nome = nome;
    }
}

// Classe Maga (Frieren) - possui Grimorio (composicao) e Ferramentas (agregacao)
class Maga
{
    public string Nome { get; set; }
    public Grimorio Grimorio { get; private set; }
    public List<Ferramenta> Ferramentas { get; set; }

    public Maga(string nome, List<Ferramenta> ferramentas)
    {
        Nome = nome;
        Grimorio = new Grimorio(); // composicao 
        Ferramentas = ferramentas; // agregacao 
    }

    public void MostrarFerramentas()
    {
        Console.WriteLine($"\nFerramentas de {Nome}:");
        foreach (Ferramenta f in Ferramentas)
        {
            Console.WriteLine($"- {f.Nome}");
        }
    }
}

// Programa principal
class Program
{
    static void Main()
    {
        // Lista de ferramentas (Agregacao)
        List<Ferramenta> ferramentas = new List<Ferramenta>()
        {
            new Ferramenta("Capacete"),
            new Ferramenta("Lanterna"),
            new Ferramenta("Corda Magica")
        };

        // Criando Maga Frieren e passando ferramentas
        Maga frieren = new Maga("Frieren", ferramentas);

        // Adicionando Feiticos ao Grimorio
        frieren.Grimorio.AdicionarFeitico(new Feitico("Chama Eterna", "Fogo"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Muralha de Gelo", "Gelo"));
        frieren.Grimorio.AdicionarFeitico(new Feitico("Luz Curativa", "Luz"));

        // Exibindo informacoes
        Console.WriteLine($"Maga: {frieren.Nome}");
        frieren.MostrarFerramentas();
        frieren.Grimorio.MostrarFeiticos();

        Console.ReadKey();
    }
}
