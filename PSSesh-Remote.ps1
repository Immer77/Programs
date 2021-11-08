#Start med indtast Credentials
$cred = Get-Credential

#Assign Computer variable med computernavn
$computer = "PBI-SDC01", "PBI-FIL01"

#Her connecter vi til sessionen.
$sesh = New-PSSession -ComputerName $computer
Enter-PSSession $sesh -Credential $cred

#Invoke-Command kør script på remote PC
Invoke-Command -ComputerName | ForEach-Object $computer -ScriptBlock $Scriptpath
