Connect-AzureAD
$upn = "DiegoS@M365x956663.OnMicrosoft.com"

Get-AzureADUser -ObjectId $upn | Select-Object UserprincipalName,@{
    N="PasswordNeverExpires";E={$pas.PasswordPolicies -contains "DisablePasswordExpiration"}
}

#I tilfælde af at passwordneverexpires er false skal nedenstående cmdlet benyttes
if(!$pas)
{
Set-AzureADUser -ObjectId $upn -PasswordPolicies DisablePasswordExpiration
}
