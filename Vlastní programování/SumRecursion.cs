using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace SumRecursion
{
    class Program
    {
        static public void Welcome()
        {
            Console.WriteLine("Hello everybody!");
        }
        static public int MyFun(int i)
        {
            if (i > 0) { Console.Write($"{i} "); MyFun(i - 1); return 0; }
            else return 0;
        }

        static public int MyFun2(int i, int n)
        {
            if (n <= i) { Console.Write($"{n} "); MyFun2(i,n+1); return 0; }
            else return 0;
        }

        static public int Sum(int i, int sum)
        {
            /*if (i < 0) { return 0; }
            else {
                sum += i;
                Sum(i - 1, sum);
                return 0;
            }*/

            if (i > 0) {
                sum += i;              
                return Sum(i - 1, sum);
            }
            else return sum;
        }

        static public void Triangle(int n)
        {
            for (int i = 0; i < n; i++)
            {
                for (int j = 0; j < n; j++)
                {
                    if (i >= j) Console.Write(i+1);
                }
                Console.WriteLine();
            }
        }

        static public void Triangle2(int n)
        {
            int q = 1;
            for (int i = 0; i < n; i++)
            {
                for (int j = 0; j < n; j++)
                {
                    if (i >= j)
                    {
                        Console.Write(q);
                        Console.Write(" ");
                        q++;
                    }
                }
                Console.WriteLine();
            }
        }

        static void Main(string[] args)
        {
            Welcome();
            string input = Console.ReadLine();
            int.TryParse(input, out int num);
            //Console.WriteLine(num);
            MyFun(num);
            Console.WriteLine();
            MyFun2(num, 1);
            Console.WriteLine();
            Console.Write("Sum = {0}", Sum(num, 0));
            Console.WriteLine();
            Console.WriteLine();
            Console.WriteLine("Here comes first triangle: ");
            Triangle(num);
            Console.WriteLine();
            Console.WriteLine("Here comes second triangle: ");
            Triangle2(num);
            Console.WriteLine();
            Console.ReadKey();
        }
    }
}
