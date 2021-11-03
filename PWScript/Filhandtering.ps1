#Get-Childitem

#Se filerne i mappen
Get-ChildItem -Force C:\School

#Se alle filer i mappen og tilhørende undermapper
Get-ChildItem -Force C:\School -Recurse

#Opret mappe
New-Item -Path C:\School\Opgave1 -ItemType Directory

#Opret fil
New-Item -Path C:\School\Opgave1\fil.txt -ItemType File

#Sletning af filer eller mapper
Remove-Item -Path C:\School -Force -Recurse

Remove-Item -Path C:\School\Opgave1\fil.txt -Force

#Omdøbning af filer
Rename-Item -Path C:\School\Opgave1\fil.txt -NewName "fil2.txt"

#Omdøbning af extensions, her ændres den til en .bak fil eller en .old
Get-ChildItem C:\School\Opgave1\fil.txt | Rename-Item -NewName {$_.Name -replace '\.txt$','.bak'}

#Kopier en fil eller mappe
Copy-Item -Path C:\School\Opgave1\fil.txt -Destination C:\School\Opgave1\fil2.txt

#Kopierer alle filer til en bestemt lokation
Copy-Item -Filter *.txt -Path C:\School\Opgave1

#Flyt en fil
Move-Item -Path C:\School\Opgave1\fil.txt -Destination C:\School\fil.txt

#Flyt en mappe
Move-Item -Path C:\School\Opgave1 -Destination C:\School\

#Skriv data ind i en fil
$data = "Dette er min data"
Add-Content C:\School\Opgave1\fil.txt $data

#Zip en mappe
Compress-Archive -Path C:\School\*- -DestinationPath C:\School\school.Zip