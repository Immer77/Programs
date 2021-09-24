# hunt for admin users that allow delegation, logged into servers that allow unconstrained delegation
Find-DomainUserLocation -ComputerUnconstrained -UserAdminCount -UserAllowDelegation