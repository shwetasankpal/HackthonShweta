using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using System.Threading.Tasks;

namespace ShwetaAssignment
{
    internal class Assignment2
    {
        static void ShowEvenOdd(int[] numbers)
        {
           
            foreach (int num in numbers)
            {
                if (num % 2 == 0)
                {
                    Console.WriteLine($"Even no is {num}");
                }

                else
                {
                    Console.WriteLine($"Odd num is {num}");
                }
            }
        }
        
        public static void Main(string[] args)
        { 
            Console.WriteLine("Enter the num of elements");
            int size = Convert.ToInt32(Console.ReadLine());
            int [] num =new int[size];

         
            for (int i = 0; i < size; i++)
            {
                Console.WriteLine($"element number { i + 1} ");
                    num[i] = Convert.ToInt32(Console.ReadLine());

            }
            ShowEvenOdd(num);
        }
    }
}
      













