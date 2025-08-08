using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ShwetaAssignment
{
    internal class Assignment3
    {
        static void Main()
        {
           bool condition = false;
            do
            {
                Console.WriteLine("Enter math cal");
                Console.WriteLine("Enter the first num");
                double num1 = Convert.ToDouble(Console.ReadLine());

                Console.WriteLine("Enter the operator");
                string op = Console.ReadLine();

                Console.WriteLine("Enter the second number");
                double num2 = Convert.ToDouble(Console.ReadLine());

                double result = 0;
                //bool isValid = true;

                //perform operation
                switch (op)
                {
                    case "+":
                        result = num1 + num2;
                        Console.WriteLine($"result: {result}");
                        break;

                    case "-":
                        result = num1 - num2;
                        Console.WriteLine($"result: {result}");

                        break;
                    case "*":
                        result = num1 * num2;
                        Console.WriteLine($"result: {result}");

                        break;
                    case "/":
                        if (num2 != 0)
                        {
                            result = num1 / num2;
                            Console.WriteLine($"result: {result}");

                        }
                        else
                        {
                            Console.WriteLine("can not divide by zero");
                           
                        }
                        break;

                    case "%":
                        if (num2 != 0)
                        {
                            result = num1 % num2;
                            Console.WriteLine($"result: {result}");
                        }
                        else
                        {
                            Console.WriteLine("Modulo by zero");
                        }
                            break;

                    default:
                        Console.WriteLine("Invalid Operator");
                        // isValid = false;
                        break;
                }
                Console.WriteLine("do u want to continue (Y or N)");
                string decision = Console.ReadLine();
                if (decision == "Y")
                {
                    condition = true;
                }
                else
                {
                    condition= false;
                }


            } while (condition);
        }
    }
}

