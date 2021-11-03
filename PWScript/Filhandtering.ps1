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