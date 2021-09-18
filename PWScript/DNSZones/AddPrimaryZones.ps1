import-csv -Delimiter ";" ./Zoner.csv | ForEach-Object -Begin $null -process { 
Write-Output "$($_.ZoneName)" }, { 
Add-DnsServerPrimaryZone -Name "$($_.ZoneName)" -ZoneFile "$($_.ZoneName).dns" } -End $null