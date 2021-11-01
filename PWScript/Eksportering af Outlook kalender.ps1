#Eksportering af kalender opgaver fra en mailboks til en anden

#Skal køres inden de 2 nederste kan køres
New-ManagementRoleAssignment –Role “Mailbox Import Export” –User DOMAIN\USER

New-MailboxExportRequest -Mailbox <Source> -FilePath <PST Name> -IncludeFolders "#Calendar#"

New-MailboxImportRequest -Mailbox <Target> -FilePath <PST Name> -IncludeFolders "#Calendar#"