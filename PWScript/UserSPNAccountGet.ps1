# find all users with an SPN set (likely service accounts)
Get-DomainUser -SPN

# find all service accounts in "Domain Admins"
Get-DomainUser -SPN | ?{$_.memberof -match 'Domain Admins'}