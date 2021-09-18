$ZoneNameList = Get-Content ./Zones.txt
Foreach ($Zone in $ZoneNameList)
{
$ZoneFilePath = $Zone + ".dns"
Add-DnsServerSecondaryZone -Name $Zone -ZoneFile $ZoneFilePath -MasterServers "ns1.hosting.inuit.gl"
Write-Output "$Zone is Created"
}