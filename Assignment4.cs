using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShwetaAssignment
{
    internal class Assignment4
    {
       
      static void Main(String[] args)
        {
            Console.WriteLine("choose the data type of array elements");
            string type = Console.ReadLine().ToLower();

            Console.WriteLine("Enter the size of array");
            int size = int.Parse(Console.ReadLine());

            Console.WriteLine($"Enter {size} values of type: {type}");

            if (type == "int")
            {
                int[] arr = new int[size];
                for (int i = 0; i < size; i++)
                {
                    Console.WriteLine($"element {i + 1}");
                    arr[i] = int.Parse(Console.ReadLine());

                }
                Console.WriteLine("array contents");
                foreach (int val in arr)
                {
                    Console.WriteLine(val + " ");
                }
            }
            else if (type == "double")
            {
                double[] arr = new double[size];
                for (int i = 0; i < size; i++)
                {
                    Console.WriteLine($"elements {i + 1}");
                    arr[i] = double.Parse(Console.ReadLine());
                }
                Console.WriteLine("array contents");
                foreach (double val in arr)
                {
                    Console.WriteLine(val + "");
                }

            }
            else if (type == "string")
            {
                string[] arr = new string[size];
                for (int i = 0; i < size; i++)
                {
                    Console.WriteLine($"elements {i + 1}");
                    arr[i] = Console.ReadLine();
                }
                Console.WriteLine("array contents");
                foreach (string val in arr)
                {
                    Console.WriteLine(val + "");
                }


            }
            else
            {
                Console.WriteLine("Invalid");
            }
            Console.WriteLine("completed");

        }
    }
}


