using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ConsoleApp4
{
    class ObjemKvadru
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Zadejte vysku kvadru:");
            string input = Console.ReadLine();

            bool suc = int.TryParse(input, out int num);

            if (!suc)
            {
                Console.WriteLine("Neplatna hodnota");
                Console.ReadLine();
                return;

            }

            Console.WriteLine("Zadejte sirku kvadru:");
            string input2 = Console.ReadLine();

            bool succ = int.TryParse(input2, out int num2);

            if (!succ)
            {
                Console.WriteLine("Neplatna hodnota");
                Console.ReadLine();
                return;

            }

            Console.WriteLine("Zadejte delku kvadru:");
            string input3 = Console.ReadLine();

            bool succc = int.TryParse(input3, out int num3);

            if (!succc)
            {
                Console.WriteLine("Neplatna hodnota");
                Console.ReadLine();
                return;

            }

            Console.WriteLine($"Objem kvadru je {RectangleVolume(num, num2, num3)}.");

            Console.ReadLine();
        }
        static int RectangleVolume(int a, int b, int c)
        {
            return a * b * c;
        }
    }
}
