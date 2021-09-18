$serialnumber = Get-WmiObject win32_bios | select Serialnumber

Start-Process https://support.lenovo.com/us/en/downloads/ds012808-lenovo-system-update-for-windows-10-7-32-bit-64-bit-desktop-notebook-workstation

Start-Sleep -Seconds 5

$wshell = New-Object -ComObject wscript.shell

for($i=0; $i -lt 8; $i++){
    
    $wshell.SendKeys('{TAB}')
    }

$wshell.SendKeys($serialnumber.Serialnumber)
$wshell.SendKeys('{ENTER}')