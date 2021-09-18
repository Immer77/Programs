$ErrorActionPreference = "stop"

$ListofUpdates = "KB5000802", 
                 "KB5000803", 
                 "KB5000812", 
                 "KB5000809", 
                 "KB5000822", 
                 "KB5000808"
                 

Foreach ($Update in $ListofUpdates){
try {
$SearchUpdates = dism /online /get-packages | findstr "Package_for"
$updates = $SearchUpdates.replace("Package Identity : ", "") | findstr "$Update"
DISM.exe /Online /Remove-Package /PackageName:$updates /quiet /norestart
Write-Output ($($Update -replace "/" -replace ":")+" was removed")
 }

catch {
$host.UI.WriteErrorLine($($Update -replace "/" -replace ":") + " was not found")
}
}


