#Script til list af Wifi-Passwords

$winfo = netsh wlan show profiles | select -Last 7

foreach ($line in $winfo)
{
    $line1 = $line.Split(':')
    foreach ($ssid in $line1[1])
    {
        $ssid = $ssid.Trim()
        netsh wlan show profile $ssid key=clear
    }
}

