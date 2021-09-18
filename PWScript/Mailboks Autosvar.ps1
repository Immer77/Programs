#Admin kontoen til deres exchange (365 Admin)

Connect-ExchangeOnline

#Selve brugeren der skal have autosvar sat op

$user = "Alexw"

#Beskeden her bliver set af folk i virksomheden.

$internBesked = "Jeg er ude af kontoret på et eller andet bla bla"

#Den besked Kunder eller folk udadtil skal se

$eksternBesked = "Jeg er ikke at træffe i øjeblikket henvend jer til <Mail>"

Set-MailboxAutoReplyConfiguration -Identity $user -AutoReplyState Enabled -InternalMessage $internBesked -ExternalMessage $eksternBesked

# Er de ude i en periode der skal skemalægges kan nedenstående kommando bruges.

Set-MailboxAutoReplyConfiguration -Identity $user -AutoReplyState Scheduled -StartTime "11/02/2021 01:00:00" -EndTime "11/12/2021 23:00:00" -InternalMessage $internBesked -ExternalMessage $eksternBesked

#Skal der slukkes for autosvar kan nedenstående bruges

Set-MailboxAutoReplyConfiguration -Identity $user -AutoReplyState Disabled -InternalMessage $internBesked -ExternalMessage $eksternBesked
