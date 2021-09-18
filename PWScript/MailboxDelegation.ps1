$usercredential = Get-Credential
$session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $usercredential -Authentication Basic -AllowRedirection
Import-PSSession $session -DisableNameChecking


Add-MailboxPermission pbi@netip.dk -User peter_immersen@hotmail.com -AccessRights FullAccess


Disconnect-ExchangeOnline -Confirm:$false