using System;
using System.Collections.Generic;
using System.Threading;

namespace EnergiBeregner
{
    class Program
    {
        public static void Main(string[] args)
        {
            double p, k, dResul, vResul, tdiff, pdiff;  // Tildeler variablerne i starten af programmet for at god ordens skyld i dette tilfælde er det 2 double den ene kW den anden pris.
            char cInput, valg;                          // Variablen der tager input fra brugeren og bruges i sammenhæng med fortsættelse af programmet.
            bool fortsaet, igen;                        // En boolsk værdi der tages i brug nede i vores do-while løkke.
            int linepos;                                // En int datatype som lagrer heltal

            VRedskaber.Logo();        // Her kaldet vi fra klassen VRedskaber metoden Logo, som printer logoet ud på skærmen med til at skabe noget visuelt.
            VRedskaber.ProgressBar(); // En loading bar der løber op til 100, også med kun på grund af det visuelle aspekt.
            Thread.Sleep(2000);       // Her tager vi brug af klassen thread som er blevet sat til 2000 millisekunder hvilket er 2 sekunder inden den fortsætter til.
            VRedskaber.Exclaimer();   // En exclaimer til at vise hvem det er der står bag programmet og copyright.

            do                                          // Så begynder vi do-while løkken 
            {   
                VRedskaber.MainMenuOptions();           // Den visuelle main menu.
                cInput = Console.ReadKey(true).KeyChar; // Her hvis brugeren trykker en knap vil det være true, så programmet fortsætter ikke medmindre der bliver trykket.
                cInput = char.ToUpper(cInput);          // Konvertere det til upper, såfremt brugeren skriver q så er vi sikker på at den rammer ind i case 'Q'.
                Console.Clear();                        // Rydder konsollen.
                fortsaet = false;                       // Sætter fortsæt = false.

                VRedskaber.ClearLine(1);                                        // Rydder linje 2

                switch (cInput)                                                 // Så begynder switchen  .
                {
                    case '1':                                                   // I tilfælde af at det er nummer 1.
                        VRedskaber.ClearLine(1);                                // Denne kommando bliver taget i brug når der skal ryddes en linje efter der er skrevet en
                        Console.WriteLine("Du har valgt Energiberegner");       // Skriver noget ud og skifter en linje

                        VRedskaber.ClearLine(2);                                // Rydder linjen 
                        Console.Write("Indtast maengden af kW, pr. Kvartal: "); // Beder brugeren 
                        linepos = Console.CursorLeft;                           // Gemmer nuværende kollonne position
                        k = Calculations.TjekNummer(linepos);                   // Bruger Metoden til at tjekke nummeret samtidig med at den læser brugerens input
                        
                        VRedskaber.ClearLine(2);                                // Rydder linjen
                        Console.Write("Indtast Prisen pr kW: ");                // Skriver på samme linje og beder om at indtaste prisen pr. KW
                        linepos = Console.CursorLeft;                           // Gemmer nuværende kolonne position
                        p = Calculations.TjekNummer(linepos);                   // Tjekker om det er et nummer der er blevet skrevet ind.
                                                
                        VRedskaber.ClearLine(2);                                // Rydder linjen
                        dResul = Calculations.EnergyPrice(p, k);                // Tager den metode som returnere et resultat og ligger det over i dResul så det kan bruges senere hen         
                        vResul = Calculations.EnergyBesparelse(k);              // tager den metode som beregner besparelsen på at tage os
                        tdiff = dResul - vResul;                                // differencen mellem deres resultat og vores resultat
                        pdiff = ((dResul - vResul) / dResul * 100);             // Tager differencen i procent, så der bliver vist hvor meget 
                              
                        if (vResul < dResul)                  // I det tilfælde den betingelse er sand og vores er billigere.
                        {
                            Console.Clear();                  // Rydder konsollen
                            Console.SetCursorPosition(0, 1);  // Sætter linjens position til 0, 1 så den står på den rigtige position i programmet
                            Calculations.EnergyPrice(p, k);   // Viser udregningen til hvor meget de egentlig
                            Console.WriteLine($"Det du kan spare ved at tage os er {Math.Round(tdiff, 2)}kr. svarende til {Math.Round(pdiff, 2)}%\n\n"); //Skriver en linje ud hvor den tager det der hidtil er blevet skrevet ind 
                        }                          
                        else                                                                    // I tilfælde af første betingelse ikke er true så vil vi komme ned i denne else   
                        {
                            Console.Clear();                                                    // Rydder konsol vinduet
                            Console.SetCursorPosition(0, 1);                                    // Sætter positionen af teksten
                            Calculations.EnergyPrice(p, k);                                     // Viser hvor meget de bruger og hvad det samlet er
                            Console.WriteLine("Vi kan desvaerre ikke konkurrere med den pris"); // Printer en linje ud i konsollen hvor der skrives vi ikke kan konkurrere                                                      
                        }                                                       
                        do // Begynder do-while loopet                        
                        {
                            VRedskaber.ClearLine(3);                                  // Sætter det her på linje 4
                            Console.Write("Vil du fortsætte med lommeregneren? Y/N"); // Spørger brugeren om de har lyst til at fortsætte
                            valg = Console.ReadKey(true).KeyChar;                     // Tjekker her om der er blevet trykket på noge
                            valg = char.ToLower(valg);                                // Sætter det til lower for at sikre sig at det er ligemeget om brugeren skriver et stor y ind
                           
                            if (valg == 'y')                           // Hvis valget er y så betyder det at brugeren ønsker at fortsætte med lommegeregneren
                            {
                                Console.Clear();                       // Rydder konsollen
                                fortsaet = true;                       // Sætter fortsaet = true hvilket betyder vores store do-while loop er true og det vil blive kørt for ny igen
                                break;                                 // Break for at sikre os vi kommer ud af loopet
                            }                                   
                            else if (valg == 'n')                      // I tilfælde af at brugeren skriver 'n'          
                            {
                                Console.Clear();                       // Rydder konsollen
                                fortsaet = false;                      // Fortsaet = false så vi bryder ud af det omsluttende 
                                Console.Write("Tak for denne gang");   // Skriver Tak for denne gang
                                Thread.Sleep(2000);                    // Bliver brugt til at vente 2 sekunder før programmet bliver lukket.
                                break;                                 // Breaker her ud for at sikre os vi kommer ud af loopet
                            }                            
                            else             // såfremt ingen af de ovenstående betingelser bliver opfyldt vil de kommer ned i denne 'else'
                            {
                                igen = true; // De vil her bliver smidt tilbage i starten og blive bedt om at skrive det rigtige ind.
                            }                            
                        } while (igen); // Slutningen på vores do while
                        break;          // Break ud af den lange switch fra starten af programmet                
                    case 'Q':                                    // I tilfælde af de skriver 'Q' inde i menuvalget har de valgt at quitte programmet
                        Console.WriteLine("Tak for denne gang"); // Skriver en linje der fortæller brugeren tak for denne gang                       
                        Thread.Sleep(2000);                      // Venter 2 sekunder før den quitter
                        Environment.Exit(0);                     // Her har vi taget brug af enviroment der bruges til at gøre ting ved konsollen, vi har brugt exit 0 kommandoen som lukker konsollen
                        break;                                   // breaker ud af vores switch, den burde ikke vøre nødvendig siden vi ovenover har en der exit, men den skal være med
                    default:             // Er ingen af de ovenstående cases blevet brugt vil brugere komme ned i denne default
                        fortsaet = true; // De vil derfor blive smidt tilbage 
                        break;           // Breaker ud af switchem
                }            
            } while(fortsaet); // Slutningen af vores do-while og slutningen på programmet
        }
    }
}