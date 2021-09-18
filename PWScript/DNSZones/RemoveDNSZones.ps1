$ZoneNameList = Get-Content ./Zones.txt
Foreach ($Zone in $ZoneNameList)
{
$ZoneFilePath = $Zone + ".dns"
Remove-DnsServerZone $Zone -PassThru -Verbose -Force
Write-Output "$Zone removed"
}