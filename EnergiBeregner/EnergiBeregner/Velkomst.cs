using System;
using System.Collections.Generic;
using System.Text;
using System.Threading;
using System.Linq;

namespace EnergiBeregner
{
    public class VRedskaber // Klassen til vores redskaber som logo, loading bar, menu og start besked/exclaimer.
    {
        public static void Logo() // Intro Logo.
        {
            char[] match = new[] { 'T', 'r', 'i', 'S', 'a', 't', '-'};  // Char symboler til logoet så vi kan arbejde grafisk med det.
            Console.WindowWidth = 150;                                  // Console bredde sat manuelt efter behov.
            Console.WindowHeight = 40;                                  // Console højde sat maunelt efter behov.
            List<char> LogoList = new List<char>();                     // En liste af flere strings, ASCII art intrologo.

            LogoList.AddRange(@"  TTTTTTTTTTTTTTTTTTTTTTT                     iiii                      SSSSSSSSSSSSSSS      tttt                                                !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"  T:::::::::::::::::::::T                    i::::i                   SS:::::::::::::::S  ttt:::t                                                !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"  T:::::::::::::::::::::T                     iiii                   S:::::SSSSSS::::::S  t:::::t                                                !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"  T:::::TT:::::::TT:::::T                                            S:::::S     SSSSSSS  t:::::t                                                !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"  TTTTTT  T:::::T  TTTTTTrrrrr   rrrrrrrrr  iiiiiii                  S:::::S        ttttttt:::::ttttttt      aaaaaaaaaaaaa  rrrrr   rrrrrrrrr    !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"          T:::::T        r::::rrr:::::::::r i:::::i                  S:::::S        t:::::::::::::::::t      a::::::::::::a r::::rrr:::::::::r   !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"          T:::::T        r:::::::::::::::::r i::::i                   S::::SSSS     t:::::::::::::::::t      aaaaaaaaa:::::ar:::::::::::::::::r  !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"          T:::::T        rr::::::rrrrr::::::ri::::i  ---------------   SS::::::SSSSStttttt:::::::tttttt               a::::arr::::::rrrrr::::::r !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"          T:::::T         r:::::r     r:::::ri::::i  -:::::::::::::-     SSS::::::::SS    t:::::t              aaaaaaa:::::a r:::::r     r:::::r !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"          T:::::T         r:::::r     rrrrrrri::::i  ---------------        SSSSSS::::S   t:::::t            aa::::::::::::a r:::::r     rrrrrrr !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"          T:::::T         r:::::r            i::::i                              S:::::S  t:::::t           a::::aaaa::::::a r:::::r             !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"          T:::::T         r:::::r            i::::i                              S:::::S  t:::::t    tttttta::::a    a:::::a r:::::r             !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"        TT:::::::TT       r:::::r           i::::::i                 SSSSSSS     S:::::S  t::::::tttt:::::ta::::a    a:::::a r:::::r             !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"        T:::::::::T       r:::::r           i::::::i                 S::::::SSSSSS:::::S  tt::::::::::::::ta:::::aaaa::::::a r:::::r             !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"        T:::::::::T       r:::::r           i::::::i                 S:::::::::::::::SS     tt:::::::::::tt a::::::::::aa:::ar:::::r             !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"        TTTTTTTTTTT       rrrrrrr           iiiiiiii                  SSSSSSSSSSSSSSS         ttttttttttt    aaaaaaaaaa  aaaarrrrrrr             !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"                                                                                           _______ _   __ ______ ____   ________  __!"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"                                                                                          /  ____// | / // ____// __ \ / ____/\ \/ /!"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"                                                                                         / __ /  /  |/ // __/  / /_/ // / __   \  / !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"                                                                                        / /____ / /|  // /___ / _, _// /_/ /   / /  !"); // string bliver tilføjet til String List Logolist for hver enkelt char.
            LogoList.AddRange(@"                                                                                       / _____//_/ |_//_____//_/ |_| \____/   /_/    "); // string bliver tilføjet til String List Logolist for hver enkelt char.
        
            Console.WriteLine(); // Tomlinje nylinje til at gøre plads til loadingbar.
            Console.WriteLine(); // Tomlinje nylinje.

            foreach (char cLetter in LogoList) // For hver karakter i Logolost loop.
            {
                // Array af bogstaverletters from logo letter-outline to color
                if (match.Contains(cLetter) == true)                    // Boolsk test this et a bogstaver i char fra LogoList er et match med en i array.
                {
                    Console.ForegroundColor = ConsoleColor.DarkMagenta; // Set tekst frave til cyan.
                    Console.Write("{0}", cLetter);                      // Output farvet char fra LogoList.
                    Console.ResetColor();                               // Reset color fra cyan til default console color.
                }
                else if (cLetter == '!')                                // Hvis char fra LogoList er !
                {
                    Console.WriteLine();                                // Næste Linje.
                }
                else                                                    // Hvis de andre two  if / else if ikke er opfyldt.
                {
                    Console.ForegroundColor = ConsoleColor.Green;       // Sætter tekst farven til grøn.
                    Console.Write("{0}", cLetter);                      
                    Console.ResetColor();                               // Nulstiller farven til default.
                }
            }
        }
        /*********** Loading bar ProgressBar ****************/
        public static void ProgressBar()
        {
            Console.CursorVisible = false;                         // Gør Consol Curser usynlig.
            Console.SetCursorPosition(2, 1);                       // Sætter positionen for vores loading bar.
            
            for (int i = 0; i <= 140; i++)                         // Progressbar loop, for hver i der er mellem 0 og 120, læg 1 til i.
            {
                for (int y = 0; y < i; y++)                        // Progress bar skriv block i bar, for hver y der er mindre end i, dvs at tallet i loadingbaren følger blokkene.
                {
                    Console.ForegroundColor = ConsoleColor.Blue;   // Sætter tekst farven til blå.
                    Console.Write("█");                            // Skriv blok icon.
                    Console.ResetColor();                          // Nulstiller farven til default.
                }

                if (i > 40)                                        // Hvis i er over 20, for at strække progress bar til passende consol width.
                {
                    Console.ForegroundColor = ConsoleColor.Yellow; // Sætter tekst farven til gul.
                    Console.Write(i - 40);                         // Skriv efter 20 1 - 100, for at få loading talr til at passe med bar i passende consol bredde. 
                    Console.ForegroundColor = ConsoleColor.Green;  // Sætter tekst farven til grøn.
                    Console.Write("/100");
                }
                else                                               // Ellers udfør.
                {
                    Console.ForegroundColor = ConsoleColor.Yellow; // Sætter tekst farven til gul.
                    Console.Write("0");                            // Tal skrives som 0.
                    Console.ForegroundColor = ConsoleColor.Green;  // Sætter tekst farven til grøn.
                    Console.Write("/100");                         // Tal skrives ud af /100, bruges faktuelt de første 20 iterationer da consol er 120 bred.
                    Console.ResetColor();                          // Nulstiller farven til default.
                }
                Console.SetCursorPosition(2, 1);                   // Set console curser position to coloum 1 line 1.
                Thread.Sleep(1);                                   // Programmet venter 10 ms med at genoptage.
            }
            Console.ResetColor();                                  // Nulstiller farven til default.
        }

        /*********** Velkomst besked / Intro ****************/
        public static void Exclaimer()
        {
            // Informations boks der bliver udskrevet linje for linje. Enkelte linjer bliver udskrevet med andre farver end default. Linje 7, 8, 9.
            Console.Clear();
            Console.WriteLine("  *------------------------------------------------------------------------------------------------------------------------------------------------*"); // Skriv tekst ud i consollen.
            Console.WriteLine("  *                                                                                                                                                *"); // Skriv tekst ud i consollen.
            Console.WriteLine("  *                         Velkommen Til Tri-Star Energy, en energiberegner der hjælper dig med at finde det bedste tilbud                        *"); // Skriv tekst ud i consollen.
            Console.WriteLine("  *                  Jeg er stadig i chok over hvor godt tilbud du får, og er det ikke godt betaler vi 10.000 kr. af egen lomme                    *"); // Skriv tekst ud i consollen.
            Console.WriteLine("  *                                        Copyright 2020 Tri-Star Energy <TristarEnergy@Tristar.dk>                                               *"); // Skriv tekst ud i consollen.
            Console.WriteLine("  *                                                                                                                                                *"); // Skriv tekst ud i consollen.
            Console.Write("  *                                                ");                                                                                                      // Skriv tekst ud i consollen.
            Console.ForegroundColor = ConsoleColor.Cyan;                                                                                                                               // Sæt consol tekst farve til Cyan.
            Console.Write("§");                                                                                                                                                        // Skriv tekst ud i consollen.
            Console.ForegroundColor = ConsoleColor.Red;                                                                                                                                // Sæt consol tekst farve til Rød.
            Console.Write("     Tryk 'Enter' for at forsætte" + "     ");                                                                                                              // Skriv tekst ud i consollen.                    
            Console.ForegroundColor = ConsoleColor.Cyan;                                                                                                                               // Sæt tekst farve til Cyan.
            Console.Write("§");                                                                                                                                                        // Skriv tekst ud i consollen.
            Console.ResetColor();                                                                                                                                                      // Reset consol tekst farve til default.
            Console.WriteLine("                                                        *  ");                                                                                          // Skriv tekst ud i consollen.
            Console.WriteLine("  *                                                                                                                                                *"); // Skriv tekst ud i consollen.
            Console.WriteLine("  *------------------------------------------------------------------------------------------------------------------------------------------------*"); // Skriv tekst ud i consollen.
            
            while (Console.ReadKey(true).Key != ConsoleKey.Enter) { } // Vent på at brugeren har trykket på en tast for at gå videre, true for at tasten ikke blvier skrevet på consollen.
           
            Console.Clear();
        }
        /*********** Options for mainmenu ****************/
        public static void MainMenuOptions() // Methode til Mainmenu.
        {
            Console.Clear();                                                  // Clear consollen.
            Console.WriteLine("  ________________________________________ "); // Skriv tekst ud i consollen.
            Console.WriteLine(" |                                        |"); // Skriv tekst ud i consollen.
            Console.WriteLine(" |   Vælg en af følgende valgmuligheder   |"); // Skriv tekst ud i consollen.
            Console.WriteLine(" |----------------------------------------|"); // Skriv tekst ud i consollen.
            Console.WriteLine(" | [ 1 ] Udregn dit energi tilbud         |"); // Skriv tekst ud i consollen.
            Console.WriteLine(" | [ Q ] Afslut                           |"); // Skriv tekst ud i consollen.
            Console.WriteLine(" |________________________________________|"); // Skriv tekst ud i consollen.
        }
        public static void ClearLine(int line)         // Methode til rens af input nr linje.
        {
            Console.SetCursorPosition(0, line);        // Sæt Konsol curser til kolonne 3 og værdien for line som linje.
            Console.Write("                                                                                                          "); // Masser af mellemrum skrives i konsollen.
            Console.SetCursorPosition(0, line);        // Sæt Konsol curser til kolonne 3 og  værdien for line som linje.
        }
    }
}