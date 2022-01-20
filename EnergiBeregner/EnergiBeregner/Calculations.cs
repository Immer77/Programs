using System;
using System.Collections.Generic;
using System.Text;

namespace EnergiBeregner
{
    class Calculations // Denne klasse tages i brug til de udregninger der skal foretages inde i vores main program
    {
        public static double EnergyPrice(double p, double k) // Metoden energyPrice tager 2 input og bruges til at omregne det til prisen på din el-aftale
        {
            double result;  // Datatypen double der tager variablen result og initialisere den
            Console.WriteLine($"I alt benytter du {k}kWh til en pris på {p} kr. kwh. det giver samlet: " + (p * k) + " Kroner"); // Her udskriver den en linje til konsollen hvor den også regner p*k
            result = p * k; // Her sætter vi værdien t
            return result;  // Returnere result op til vores værdi i double
        }
        public static double EnergyBesparelse(double k) // Denne metode bliver brugt til at udregner den besparelse de kan få såfremt de vælger os
        {
            const double vkW = 2.32;                    // Sætter en konstant her da vores el pris 'vkW' 
            double result = vkW * k;                    // Datatypen double der tager variablen result og initialisere den
            return result;                              // Returnerer result op til vores method, da vores method er har returtypen double         
        }
        public static double TjekNummer(int linepos) // Denne method bliver brugt til at tjekke nummeret efter og sikre sig at det er et nummer der bliver skrevet ind
        {
            double nummer;                                                  // initialisere variablen nummer med datatype værdien double
            bool talCheck = double.TryParse(Console.ReadLine(),out nummer); // Her har vi en boolsk datatype der har variablen tal check, den er sand såfremt det er et tal
            
            while (!talCheck)                                               // Så længe TalCheck ikke er sand vil dette while blive kørt 
            {
                Console.Write("Dette er ikke et tal forsøg igen");          // Skriver ud uden at skifte linje 
                Console.SetCursorPosition(linepos, 2);                      // Ser hvor du er ligenu på linjen og bruger det som en variabel.
                Console.WriteLine("                                                                                                                "); // Dækker denne så den er ude af konsollen så man ikke kan se hvad der bliver skrevet.
                Console.SetCursorPosition(linepos, 2);                      // Ser hvor du er ligenu på linjeg og bruger det som en variabel.
                talCheck = double.TryParse(Console.ReadLine(), out nummer); // Tjekker igen om det der blvier skrevet ind er et tal og i tilfælde det er så bliver vi brudt ud af løkken
            }
            return nummer;                                                  // returnere tallet så snart det er bekræftet det er et tal der bliver skrevet. 
        }
    }
}