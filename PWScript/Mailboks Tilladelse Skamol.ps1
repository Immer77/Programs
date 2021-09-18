Connect-ExchangeOnline

Set-MailboxFolderPermission -Identity "tla@skamol.dk:\calendar" -User Default -AccessRights Reviewer

#Axapta skal kunne sende mails på vegne af brugeren:

Add-RecipientPermission -Identity tla@skamol.dk -AccessRights SendAs -Trustee info@skamol.com -Confirm:$false
Add-RecipientPermission -Identity tla@skamol.dk -AccessRights SendAs -Trustee skamolprocessmail@skamol.dk -Confirm:$false