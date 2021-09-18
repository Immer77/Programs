
#Tilkobler MicrosoftOnline Services
Connect-MsolService


$currentName = "nuværende brugernavn@nuvnavn.com"
$newName = "nyt brugernavn@nytnavn.com"

#Ændrer det nuværende brugernavn til det nye brugernavn
Set-MsolUserPrincipalName -UserPrincipalName $currentName -NewUserPrincipalName $newName