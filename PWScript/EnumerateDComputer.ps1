# enumerate all servers that allow unconstrained delegation, and all privileged users that aren't marked as sensitive/not for delegation
$Computers = Get-DomainComputer -Unconstrained
$Users = Get-DomainUser -AllowDelegation -AdminCount