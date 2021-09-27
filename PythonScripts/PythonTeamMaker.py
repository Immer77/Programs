#Random Team generator
import random


lol_players = input("Indtast Navnene på de forskellige spillere brug komma imellem: \n").split(",")

teamA = []
teamB = []

while len(lol_players)>0:
    a = random.choice(lol_players)
    teamA.append(a)
    lol_players.remove(a)
    if len(lol_players)>0:
        b = random.choice(lol_players)
        teamB.append(b)
        lol_players.remove(b)
print("Første hold er : ", teamA)
print("Det andet hold er : ", teamB)