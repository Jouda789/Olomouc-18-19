using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp2
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Maximalni hodnota intu je {0}.", int.MaxValue);
            Console.WriteLine("Minimalni hodnota intu je {0}.", int.MinValue);
            Console.WriteLine($"Velikost intu v bajtech je {sizeof(int)}.");
            Console.WriteLine($"Maximalni hodnota longu je {long.MaxValue}, minimalni hodnota je {long.MinValue}.");
            Console.WriteLine($"Velikost longu v bajtech je {sizeof(long)}.");
            Console.WriteLine($"Maximalni hodnota bytu je {byte.MaxValue}, minimalni hodnota je {byte.MinValue}.");
            Console.WriteLine($"Velikost bytu v bajtech je {sizeof(byte)}.");

            Console.ReadLine();
        }

    }
}