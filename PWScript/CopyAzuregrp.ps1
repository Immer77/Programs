#Login Credentials
$user = "admin@M365x956663.onmicrosoft.com"
$pword = ConvertTo-SecureString -String "q1w27ZGF8G" -AsPlainText -Force
$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList $user, $pword

Connect-AzureAD -Credential $credential
$usercf = Get-AzureADUser -ObjectId "AlexW@M365x956663.OnMicrosoft.com" 
$userct = Get-AzureADUser -ObjectId "AllanD@M365x956663.OnMicrosoft.com"


$groups = Get-AzureADUser -ObjectId $usercf.ObjectId | Get-AzureADUserMembership 

foreach($group in $groups)
{
    try{
    Add-AzureADGroupMember -ObjectId $group.ObjectId -RefObjectId $userct.ObjectId
    }
    Catch{
    Write-Host "Group Already exists"
    }
}