using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp3
{
    class Program
    {
        static void Main(string[] args)
        {
            int cislo1 = 12;
            int cislo2 = 34;

            Console.WriteLine($"Cislo1 = {cislo1}, cislo2 = {cislo2}");

            cislo1 = cislo1 + cislo2;
            cislo2 = cislo1 - cislo2;
            cislo1 = cislo1 - cislo2;

            Console.WriteLine($"Cislo1 = {cislo1}, cislo2 = {cislo2}");

            cislo1 = cislo1 ^ cislo2;
            cislo2 = cislo1 ^ cislo2;
            cislo1 = cislo1 ^ cislo2;

            Console.WriteLine($"Cislo1 = {cislo1}, cislo2 = {cislo2}");

            Console.ReadLine();
        }
    }
}