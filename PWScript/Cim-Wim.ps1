#Wim OG CIM
#Funktion
function ConnectToComputer {
    param (
        [string]$computer
    )
    Get-WmiObject Win32_OperatingSystem -ComputerName $computer
    
}

ConnectToComputer("PBI-Probe01")

#WMI-Instance
#Smid nedenstående ned 
#netsh advfirewall firewall set rule group="Windows Management Instrumentation (WMI)" new enable=yes
#explicitly states many of the default parameters
$myComputer = Get-WmiObject -ComputerName "." -Namespace "root\cimv2" -Query "SELECT * FROM Win32_ComputerSystem"
foreach ($computer in $myComputer)
{ "System Name: " + $computer.name }
#assumes the default values are correct
Get-WmiObject Win32_ComputerSystem | Format-Table "Name"

Get-WmiObject $myComputer

#Skaf information på Ram
Get-CimInstance