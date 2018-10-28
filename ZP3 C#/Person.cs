using System;
using System.Collections.Generic;

public enum Pohlavi { muz, zena };

class Person
{
    private string jmeno = null;
    private DateTime datumNarozeni = default(DateTime);
    private int vek = 0;
    private Pohlavi pohlavi = Pohlavi.muz;
    private int rodneCislo = 0;
    private static Random nahoda = new Random();

    public bool IsOlderThan(Person clovek)
    {
        if (this.vek > clovek.vek)
            return true;
        else
            return false;
    }

    public void InfoString()
    {
        Console.WriteLine("---------------------------------");
        Console.WriteLine($"|{" Jmeno",-9}| {this.jmeno,-20}|");
        Console.WriteLine($"|{" Narozen",-9}| {this.datumNarozeni,-20}|");
        Console.WriteLine($"|{" Vek",-9}| {this.vek,-20}|");
        Console.WriteLine($"|{" Pohlavi",-9}| {this.pohlavi,-20}|");
        Console.WriteLine($"|{" RC",-9}| {this.rodneCislo,-20}|");
        Console.WriteLine("---------------------------------\n");
    }

    public override string ToString()
    {
        return base.ToString() + ": " + jmeno.ToString()
                + "\nNarozen: " + datumNarozeni.ToString()
                + "\nVek: " + vek.ToString()
                + "\nPohavi: " + pohlavi.ToString()
                + "\nRodne cislo: " + rodneCislo.ToString()
                + "\n";
    }

    public string RandomString(int length)
    {
        var chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
        var stringChars = new char[length];
        var random = new Random();

        for (int i = 0; i < stringChars.Length; i++)
        {
            stringChars[i] = chars[random.Next(chars.Length)];
        }

        var finalString = new String(stringChars);
        return finalString;
    }


    public void SetID() //rekneme, ze ID je 4mistne cislo, jinak RC ma 10 mist
    {      
        this.rodneCislo = nahoda.Next(1000, 10000);
    }

    public void Initialize(int num, int num2)
    {
        this.jmeno = RandomString(num);
        this.vek = num2;
        if (num % 2 == 0) this.pohlavi = Pohlavi.zena;
        SetID();
    }

    public void SetID(int id)
    {
        this.rodneCislo = id;
    }

    public int GetID()
    {
        return this.rodneCislo;
    }
}

class MainClass
{
    public static void Main(string[] args)
    {
        var random = new Random();

        //cislo mezi 1 a 10 generuje jmeno

        Person clk1 = new Person();
        clk1.Initialize(random.Next(1, 10), random.Next(1, 91));
        clk1.InfoString();

        Person clk2 = new Person();
        clk2.Initialize(random.Next(1, 10), random.Next(1, 91));
        Console.WriteLine(clk2.ToString());

        Person clk3 = new Person();
        clk3.Initialize(random.Next(1, 10), random.Next(1, 91));
        Console.WriteLine(clk3.ToString());

        Person clk4 = new Person();
        clk4.Initialize(random.Next(1, 10), random.Next(1, 91));
        Console.WriteLine(clk4.ToString());

        clk1.SetID(1111);
        clk2.SetID(2222);
        clk3.SetID(3333);
        clk4.SetID(4444);

        Dictionary<int, Person> dictionary = new Dictionary<int, Person>();
        dictionary.Add(clk1.GetID(), clk1);
        dictionary.Add(clk2.GetID(), clk2);
        dictionary.Add(clk3.GetID(), clk3);
        dictionary.Add(clk4.GetID(), clk4);

        var id = 3333;

        if (dictionary.ContainsKey(id) == false)
            Console.WriteLine("Clovek s rodnym cislem {0} není ve slovniku!", id);
        else
        {
            Console.WriteLine("---------------------------------\n");
            Console.WriteLine(dictionary[id].ToString());
        }

        if (clk1.IsOlderThan(clk2))
            Console.WriteLine("Prvni osoba je starsi.");
        else
            Console.WriteLine("Druha osoba je starsi.");

        //Console.ReadLine();
    }
}