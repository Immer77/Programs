$serialnumber = Get-WmiObject win32_bios | select Serialnumber

Start-Process https://support.hp.com/dk-da

Start-Sleep -Seconds 5

$wshell = New-Object -ComObject wscript.shell

for($i=0; $i -lt 58; $i++){
    
    $wshell.SendKeys('{TAB}')
    }

$wshell.SendKeys($serialnumber.Serialnumber)
$wshell.SendKeys('{ENTER}')