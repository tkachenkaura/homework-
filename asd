using System.Security.Cryptography;
using System.Text;

namespace _20._06
{
    internal class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Choose a task to execute (1-6):");
            Console.WriteLine("1. Reverse a string/array.");
            Console.WriteLine("2. Filter unacceptable words in a string.");
            Console.WriteLine("3. Generate random characters.");
            Console.WriteLine("4. Find the missing number in an array.");
        

            int choice = int.Parse(Console.ReadLine());

            switch (choice)
            {
                case 1:
                    Task1();
                    break;
                case 2:
                    Task2();
                    break;
                case 3:
                    Task11111();
                    break;
                case 4:
                    Task4();
                    break;
                
                default:
                    Console.WriteLine("Invalid choice.");
                    break;
            }
        }

        static void Task1()
        {
            Console.WriteLine("Enter a string:");
            char[] input = Console.ReadLine().ToCharArray();
            int n = input.Length;
            for (int i = 0; i < n / 2; i++)
            {
                char temp = input[i];
                input[i] = input[n - 1 - i];
                input[n - 1 - i] = temp;
            }
            Console.WriteLine(new string(input));
        }

        static void Task2()
        {
            Console.WriteLine("Enter a string:");
            string input = Console.ReadLine();
            Console.WriteLine("Enter words to filter (comma-separated):");
            string[] forbiddenWords = Console.ReadLine().Split(',');

            foreach (var word in forbiddenWords)
            {
                string pattern = @"\b" + word.Trim() + @"\b";
                input = System.Text.RegularExpressions.Regex.Replace(input, pattern, new string('*', word.Trim().Length));
            }

            Console.WriteLine(input);
        }

        static void Task11111()
        {
            Console.WriteLine("Enter the number of characters:");
            int count = int.Parse(Console.ReadLine());

            const string chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
            StringBuilder result = new StringBuilder(count);
            using (RNGCryptoServiceProvider rng = new RNGCryptoServiceProvider())
            {
                byte[] uintBuffer = new byte[sizeof(uint)];

                while (count-- > 0)
                {
                    rng.GetBytes(uintBuffer);
                    uint num = BitConverter.ToUInt32(uintBuffer, 0);
                    result.Append(chars[(int)(num % (uint)chars.Length)]);
                }
            }
            Console.WriteLine(result.ToString());
        }

        static void Task4()
        {
            Console.WriteLine("Enter array length:");
            int n = int.Parse(Console.ReadLine());
            Console.WriteLine("Enter array elements (space-separated):");
            int[] array = Array.ConvertAll(Console.ReadLine().Split(), int.Parse);

            int expectedSum = n * (n + 1) / 2;
            int actualSum = array.Sum();
            Console.WriteLine("Missing number is: " + (expectedSum - actualSum));
        }

        
    }
    }
