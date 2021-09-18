$ErrorActionPreference = "stop"

$ListofUpdates = "/KB:5000802", 
                 "/KB:5000803", 
                 "/KB:5000812", 
                 "/KB:5000809", 
                 "/KB:5000822", 
                 "/KB:5000808"
                 

Foreach ($Update in $ListofUpdates){
try {
if (Get-Hotfix $($Update -replace "/" -replace ":")){
wusa /uninstall $Update
Wait-Process -Name "wusa"
Write-Output ($($Update -replace "/" -replace ":")+" was removed")
 }
}
catch {
$host.UI.WriteErrorLine($($Update -replace "/" -replace ":") + " was not found")
}
}



