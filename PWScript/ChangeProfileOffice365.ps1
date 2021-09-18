#Løsning til ændring af profilbillede i Office365 via powershell:

 

#1. Åbn powershell som administrator
#2. Kør denne kommando: 
Install-Module -Name ExchangeOnlineManagement
#3. Kør denne kommando “
Set-ExecutionPolicy RemoteSigned
#4. Det er nu installeret og kan bruges.
#Fremover for at forbinde til en O365 kunde i powershell så kan man blot skrive         ”Connect-ExchangeOnline”.

 

#Herefter indsættes følgende kommando, hvor du sætter det rigtige brugernavn(eller mailkonto) og stien til det rigtige billede.
#OBS. Billedet må max fylde 100 kb

 

Set-UserPhoto -Identity "Paul Cannon" -PictureData ([System.IO.File]::ReadAllBytes("C:\Users\Administrator\Desktop\<BilledNavn>.jpg"))