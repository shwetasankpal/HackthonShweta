using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

/*
 * Assignment 05
 * Create a CRUD based App for developing a Movie Database software where the user can add, remove and update movies of his Video library. It should be a menu driven program that has 4 use cases for add, removing, finding and updating movie info in the application.
 */
namespace ShwetaAssignment
{
    class Movie
    {
        public int Id { get; set; } = 100;
        public string Name { get; set; }
        public int year { get; set; }
    }

    internal class Assignment5
    {
        static List<Movie> movies = new List<Movie>();
        //static int nextId = 1;
        static void Main(string[] args)
        {

            bool status = true;
            while (status)
            {

                Console.WriteLine("1: Add Movie");
                Console.WriteLine("2: Remove movie");
                Console.WriteLine("3: Display Movie");
                Console.WriteLine("4: Update Movie");
                Console.WriteLine("5: Exit");

                string choice = Console.ReadLine();

                switch (choice)
                {
                    case "1":
                        AddMovie();
                        break;
                    case "2":
                        RemoveMovie();
                        break;
                    case "3":
                        DisplayMovie();
                        break;
                    case "4":
                        UpdateMovie();
                        break;
                    case "5":
                        Console.WriteLine("Thank you");
                        return;
                    default:
                        Console.WriteLine("Select Correct option!!");
                        break;

                }
            }
        }
        //Id,Name,year
        static void AddMovie()
        {
            Movie movie = new Movie();
            movie.Id++;
            Console.WriteLine("Enter Name of The movie to add:");
            movie.Name = Console.ReadLine();
            Console.WriteLine("Enter the year Of release");
            movie.year = int.Parse(Console.ReadLine());
            movies.Add(movie);
            Console.WriteLine("Movie added Successfully🤑🤑");

        }
        static void RemoveMovie()
        {

            Console.WriteLine("Enter the ID of the movie to remove:");
            int id = int.Parse(Console.ReadLine());

            Movie movieToRemove = movies.Find(m => m.Id == id);
            if (movieToRemove != null)
            {
                movies.Remove(movieToRemove);
                Console.WriteLine("Movie removed successfully.");
            }
            else
            {
                Console.WriteLine("Movie not found.");
            }

        }
        static void DisplayMovie()
        {


            if (movies.Count == 0)
            {
                Console.WriteLine("No movies in the database.");
                return;
            }

            Console.WriteLine("Movies in your library:");
            foreach (var movie in movies)
            {
                Console.WriteLine($"ID: {movie.Id}, Name: {movie.Name}, Year: {movie.year}");
            }
        }
        static void UpdateMovie()
        {

            Console.WriteLine("Enter the ID of the movie to update:");
            int id = int.Parse(Console.ReadLine());

            Movie movieToUpdate = movies.FirstOrDefault(m => m.Id == id);
            if (movieToUpdate != null)
            {
                Console.WriteLine("Enter new name:");
                movieToUpdate.Name = Console.ReadLine();
                Console.WriteLine("Enter new year:");
                movieToUpdate.year = int.Parse(Console.ReadLine());
                Console.WriteLine("Movie updated successfully.");
            }
            else
            {
                Console.WriteLine("Movie not found.");

            }
        }

    }
}
