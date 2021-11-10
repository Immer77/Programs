Add-Type -AssemblyName PresentationFramework
$wshell = New-Object -ComObject wscript.shell
$path = Get-Content -Path "C:\Users\pbi\OneDrive - netIP\Skrivebord\Login.txt"
[xml]$xaml = @"
<Window
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        Title="VPN-Connector3000" Height="200" Width="300">
    <Grid>
        <Label Content="VPN-Connector" HorizontalAlignment="Left" Margin="43,28,0,0" VerticalAlignment="Top" Width="100"/>
        <Button x:Name = "Ciscoelev"
            Content="CiscoElev" HorizontalAlignment="Left" Margin="55,86,0,0" VerticalAlignment="Top" Width="75"
        />
        <Button x:Name = "Random1"
            Content="Random1" HorizontalAlignment="Left" Margin="55,125,0,0" VerticalAlignment="Top" Width="75"
        />
    </Grid>
</Window>
"@
$reader = (New-Object System.Xml.XmlNodeReader $xaml)
$window = [Windows.Markup.XamlReader]::Load($reader)
$connection1 = $window.FindName("Ciscoelev")
$connection1.Add_Click({
    Start-Process -FilePath "C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe"
    Start-Sleep -Seconds 1
    $wshell.SendKeys('connect https://cloud.konkursedb.dk:444/pbi')
    Start-Sleep -Seconds 1
    $wshell.SendKeys('{ENTER}')
    Start-Sleep -Seconds 1
    $wshell.SendKeys('y{ENTER}')
    Start-Sleep -Seconds 1
    $wshell.SendKeys('pbi{ENTER}')
    $wshell.SendKeys("$path")
    $wshell.SendKeys('{ENTER}')
})
$connection2 = $window.FindName("Random1")
$connection2.Add_Click({
    Start-Process -FilePath "C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe"
    Start-Sleep -Seconds 1
    $wshell.SendKeys('connect https://cloud.konkursedb.dk:444/pbi')
    Start-Sleep -Seconds 1
    $wshell.SendKeys('{ENTER}')
    Start-Sleep -Seconds 1
    $wshell.SendKeys('y{ENTER}')
    Start-Sleep -Seconds 1
    $wshell.SendKeys('pbi{ENTER}')
    $wshell.SendKeys("$path")
    $wshell.SendKeys('{ENTER}')
})
$window.ShowDialog()