using System;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.Linq;
namespace Hackathon_Shweta
{
    internal class FrequencyCounter
    {
        static void Main()

        {
            Console.WriteLine("Enter the sentence");
            string input = Console.ReadLine();
            if (!Regex.IsMatch(input, "[a-zA-Z]"))
            {
                Console.WriteLine("0");
                return;
            }
            string[] words = input.ToLower().Split(new char[] { ' ', '.', ';', '?', '!', ':', '-', '_', ',' }, StringSplitOptions.RemoveEmptyEntries);

            Dictionary<string, int> freqDict = new Dictionary<string, int>();
            foreach (string word in words)
            {
                if (freqDict.ContainsKey(word))
                {
                    freqDict[word]++;
                }
                else
                {
                    freqDict[word] = 1;
                }
            }
            var sortedwords = freqDict.OrderByDescending(x => x.Value).ThenByDescending(x => x.Key);

            foreach (var item in sortedwords)
            {
                Console.WriteLine($"{item.Value} {item.Key}");
            }
        }
    }
}















