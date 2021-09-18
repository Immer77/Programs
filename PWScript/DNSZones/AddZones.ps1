import-csv -Delimiter ";" ./Zoner.csv | ForEach-Object -Begin $null -process { 
try {
Add-DnsServerSecondaryZone -Name "$($_.ZoneName)" -ZoneFile "$($_.ZoneName).dns" -MasterServers 192.168.242.11 
Write-Output "Zone Record for $($_.ZoneName) was created" } 

catch {$host.UI.WriteErrorLine("$_")}} -End $null
