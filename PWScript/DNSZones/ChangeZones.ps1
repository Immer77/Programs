Get-DnsServerZone | where { $_.zonetype -eq "primary" } | ForEach-Object -begin $null -process {
try {Add-DnsServerResourceRecord -ZoneName $_.zonename -ns -name $_.zonename -NameServer newdnsserver.domain.com
Add-DnsServerResourceRecord -ZoneName $_.zonename -ns -name $_.zonename -NameServer newdns2server.domain.com -ea:stop
Write-Output "Name servers was added to $($_.ZoneName)"} 
catch {$host.UI.WriteErrorLine("$_")}} -end $null