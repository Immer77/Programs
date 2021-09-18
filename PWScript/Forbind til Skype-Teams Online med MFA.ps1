
Set-ExecutionPolicy RemoteSigned
Import-Module SkypeOnlineConnector
$sfboSession = New-CsOnlineSession
Import-PSSession -AllowClobber $sfboSession

$UserName = "nla"
$Phonenumber = "96312517"
$Domainname = "europoultry.eu"
Set-CsUser -Identity sip:$UserName@$Domainname -EnterpriseVoiceEnabled $true -OnPremLineURI tel:+45$Phonenumber
Grant-CsTenantDialPlan -PolicyName “netIP” -Identity "sip:$UserName@$Domainname"