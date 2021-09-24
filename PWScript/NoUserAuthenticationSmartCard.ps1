# all users that *don't* require smart card authentication, only returning sam account names
Get-DomainUser -LDAPFilter "(!useraccountcontrol:1.2.840.113556.1.4.803:=262144)" -Properties samaccountname
Get-DomainUser -UACFilter NOT_SMARTCARD_REQUIRED -Properties samaccountname