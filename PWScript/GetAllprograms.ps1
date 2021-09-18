try{
Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* | Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table -AutoSize > C:\Users\$env:UserName\Documents\InstalledPrograms.txt
Write-Output "List saved in C:\Users\$env:UserName\Documents\InstalledPrograms.txt"
}
catch{
Write-Output "List could not be saved"
}