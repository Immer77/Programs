$ErrorActionPreference = "Stop"
$ZonerTotal = import-csv -Path .\DNSZones.csv -Delimiter ";" 
$ZonerTotal.ZoneName | ForEach-Object {
    try{
        Resolve-DnsName -Type NS -Name $_ -server "8.8.8.8" | Where-Object { $_.NameHost -eq "ns1.hosting.inuit.gl" -or $_.NameHost -eq "ns2.hosting.inuit.gl" -or $_.NameHost -eq "ns3.hosting.inuit.gl"} | Select-Object -Property Name,NameHost | Out-File -FilePath .\WorkingDNSRightNS.txt -Append
        Resolve-DnsName -Type NS -Name $_ -server "8.8.8.8" | Where-Object { $_.NameHost -ne "ns1.hosting.inuit.gl" -and $_.NameHost -ne "ns2.hosting.inuit.gl" -and $_.NameHost -ne "ns3.hosting.inuit.gl"} | Select-Object -Property Name,NameHost | Out-File -FilePath .\WorkingDNSWrongNS.txt -Append
        Write-Output "$_  -  Resolved and saved"
    }
    catch{
        $Error[0].Exception.Message | Out-File -FilePath .\ErrorDNS.txt -Append
        Write-Warning " $($Error[0].Exception.Message) "
    } 
}
