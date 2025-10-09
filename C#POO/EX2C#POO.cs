using System;
using System.Collections.Generic;

// Classe base
public class Pokemon
{
    public string Nome { get; set; }

    public Pokemon(string nome)
    {
        Nome = nome;
    }

    // Metodo
    public virtual void Atacar()
    {
        Console.WriteLine($"{Nome} realiza um ataque generico!");
    }
}

// Classe derivada: Pokemon de Fogo
public class PokemonDeFogo : Pokemon
{
    public PokemonDeFogo(string nome) : base(nome) { }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lanca uma rajada de fogo!");
    }
}

// Classe derivada: Pokemon de Agua
public class PokemonDeAgua : Pokemon
{
    public PokemonDeAgua(string nome) : base(nome) { }

    public override void Atacar()
    {
        Console.WriteLine($"{Nome} lanca um jato de agua!");
    }
}

// Programa principal
public class Program
{
    public static void Main()
    {
        // Cria lista de Pokemons
        List<Pokemon> pokemons = new List<Pokemon>();

        // Adiciona instancias
        pokemons.Add(new PokemonDeFogo("Charizard"));
        pokemons.Add(new PokemonDeAgua("Blastoise"));

        // Percorre lista e executa o ataque de cada Pokemon
        foreach (Pokemon p in pokemons)
        {
            p.Atacar();
        }

        Console.ReadLine();
    }
}
