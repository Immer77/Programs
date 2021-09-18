
#Elevate script to admin if not already
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

#Install AD and tools
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

#Set secure string password for use in Forest Install backup
$SecurePwd = ConvertTo-SecureString "10Sted" -AsPlainText -Force

#Install forest and DNS. 
Install-ADDSForest -DomainName "Test-Environment.local" -SafeModeAdministratorPassword $SecurePwd -DomainNetBiosName "TE" -InstallDns:$true -Force
