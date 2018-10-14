using System;

public enum Pohlavi { muz, zena };

class Person
{
    public string jmeno = null;
    public DateTime datumNarozeni = default(DateTime);
    public int vek = 0;
    public Pohlavi pohlavi = Pohlavi.muz;

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
        Console.WriteLine("---------------------------------");
    }
}

class MainClass
{
    public static void Main(string[] args)
    {
        Person clk1 = new Person();
        Person clk2 = new Person();
        clk1.vek = 27;
        clk2.vek = 33;

        if (clk1.IsOlderThan(clk2))
            Console.WriteLine("Prvni osoba je starsi.");
        else
            Console.WriteLine("Druha osoba je starsi.");

        clk1.jmeno = "Alena";
        clk1.pohlavi = Pohlavi.zena;
        clk1.InfoString();
    }
}