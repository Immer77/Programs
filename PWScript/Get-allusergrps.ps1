# get all the groups a user is effectively a member of, 'recursing up' using tokenGroups
Get-DomainGroup -MemberIdentity <User/Group>