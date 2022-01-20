import random
import os
import time
def Velkomst():
    print("Hej Og velkommen til mita gætte program")
    print("Du skal nu gætte et tal mellem 1-10, Held og lykke!")
    return

random.randint
tilfældighed = random.randint(1,10)
retry = True
while(retry):
    print("\n" * 80)
    Velkomst()
    sGuess = input("Gæt: ")
    if(sGuess.isnumeric()):
        iGuess = int(sGuess)
        if(iGuess == tilfældighed):
            print(f"Dit gæt var {iGuess} og tallet var {tilfældighed}")
        else:
            print(f"Dit gæt var {iGuess} dette er ikke det rigtige tal")
            valg = input("Ønsker du at forsøge igen? yes/no?")
            if(valg.lower() == "no"):
                retry = False
            else:
                retry = True
    else:
        print("Dette var ikke et tal")
        time.sleep()
        retry = True
