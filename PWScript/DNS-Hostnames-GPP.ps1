# retrieve all the computer dns host names a GPP password applies to
Get-DomainOU -GPLink '<GPP_GUID>' | % {Get-DomainComputer -SearchBase $_.distinguishedname -Properties dnshostname}