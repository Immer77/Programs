$ZoneNameList = import-csv -Delimiter ";" ./Zoner.csv

$ZoneNameList | ForEach-Object { 
try { 
Remove-DnsServerZone $_.ZoneName -force
Write-Output "$($_.ZoneName) zone record was removed succcesfully" } 
catch {$host.UI.WriteErrorLine("$_")}}