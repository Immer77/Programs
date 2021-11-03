#Finder alle lokationer
Get-PSProvider

#Skifter lokation til HKEY_LOCAL_MACHINE
cd HKLM:

#Til at skifte flere omgange tilbage
cd ..\..\..

#Skift til specifik
cd C:\Windows\System

#Find lokationen til det speciffikke program ved hjælp af at kigge i pathen.
#Derfor når du forsøger at skrive eksempelvis notepad kigger den hele path igennem.
mkdir skjult
move "exe programmet til mappe" skjult