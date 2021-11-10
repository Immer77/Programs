#Diskplads
$servers = "PBI-PRTG01","PBI-SFIL01"
foreach ($server in $servers) 
{
    if(Test-Connection $server -Count 2 -Quiet)
    {
        $info = Get-CimInstance -ClassName Win32_LogicalDisk -ComputerName $server | Select-Object {($_.Size / 1GB),($_.FreeSpace / 1GB)}
        Write-Output $server, $info >> .\data.txt
    }    
    else 
    {
        Write-Warning("Server is not responding to ping")    
    }
}

Send-MailMessage -From 'sendermail' -To 'recievermail' -Subject 'Diskplads information' -Attachments .\data.txt