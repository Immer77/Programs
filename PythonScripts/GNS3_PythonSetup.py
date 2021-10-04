#!/usr/bin/env python3
#Hvis Linux maskine ændre da til .py og chmod +x for at gøre den executable ./scriptnavn.py
import getpass
import sys
import telnetlib
import os
#Router-Configuration
"""
Pre-Configuration
enable password cisco
username peter password cisco
line vty 0 4
login local
transport input all (all for telnet and ssh)
user peter privilege 15 (For at undgå enable)
"""

def clearconsole():
    command = 'clear'
    if os.name in ('nt', 'dos'): # I tilfælde af at den kører windows.
        command = 'cls'
    os.system(command)

#Skriv host
HOST = input("Skriv host:\n")
user = raw_input("Enter your telnet username: ")
password = getpass.getpass()

tn = telnetlib.Telnet(HOST)

tn.read_until("Username: ")
tn.write(user + "\n")
if password:
    tn.read_until("Password: ")
    tn.write(password + "\n")

tn.write("e\n")
tn.write("cisco\n")
tn.write("conf t\n") 
#Nedenstående skal laves om til loops og userinput
tn.write("int loop 0\n")
tn.write("ip address 1.1.1.1 255.255.255.255\n")
tn.write("int loop 1\n")
tn.write("ip address 2.2.2.2 255.255.255.255\n")
tn.write("router ospf 1\n")
tn.write("network 0.0.0.0 255.255.255.255 area 0\n")
tn.write("end\n")
tn.write("exit\n")

print(tn.read_all())
#/Router-Configuration

#Switch VLAN-Configuration
HOST = "192.168.122.72"
user = raw_input("Enter your telnet username: ")
password = getpass.getpass()

tn = telnetlib.Telnet(HOST)

tn.read_until("Username: ")
tn.write(user + "\n")
if password:
    tn.read_until("Password: ")
    tn.write(password + "\n")


tn.write("conf t\n")
for n in range (2,10): #2, 10 er mængden af Vlan du ønsker at lave
    tn.write("vlan " + str(n) + "\n")
    tn.write("name Switch_VLAN_"+str(n)+"\n")

tn.write("end\n")
tn.write("exit\n")

print(tn.read_all())
#/Switch VLAN-Configuration


