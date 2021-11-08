#Start med indtast Credentials
$cred = Get-Credential

#Assign Computer variable med computernavn
$computer = "PBI-SDC01"

#Her connecter vi til sessionen.
$sesh = New-PSSession -ComputerName $computer
Enter-PSSession $sesh -Credential $cred
