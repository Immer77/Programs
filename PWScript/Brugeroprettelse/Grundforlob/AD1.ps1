#-----------------------------------------------------------
# Oprettelse af Share mapper samt adgangstildeling
#
#-----------------------------------------------------------


$OUpath = 'OU=User,DC=praktikant,DC=local'
$SharePath = 'C:\Shares\'
$CreatePathCMD = 'mkdir '
$SecurityGRP = 'OU=Security Groups,DC=praktikant,DC=local'

#Get-ADUser -Filter * -SearchBase $OUpath

$OUlist=Get-ADOrganizationalUnit -Filter * -SearchBase $OUpath | select name -Skip 1
foreach ($OUname in $OUlist){
 $FolderName=$SharePath+$OUname.name 
 $Folder = $OUname.name.ToString()
 Write-Host $Com

 #$FolderName | Out-File 'C:\Shares\CreateSharesFolders.cmd' -Encoding ascii -Append 
 if (!(Test-Path -Path $FolderName))
 {
     New-Item -Path $FolderName -Itemtype Directory

     # Opretter AD Security Groups, hvis de ikke findes
     $ChangeAccess="SEC-"+$Folder+"-RW"
     $ReadAccess="SEC-"+$Folder+"-RO"
     try {
       $ADRP=Get-ADGroup -Identity $ChangeAccess | select name
     }
     catch 
     {
      New-ADGroup -Name $ChangeAccess -GroupCategory Security -GroupScope Global -DisplayName $ChangeAccess -Path $SecurityGRP -Description 'Auto create script'     
     }
     try {
       $ADRP=Get-ADGroup -Identity $ReadAccess | select name
     }
     catch 
     {
     New-ADGroup -Name $ReadAccess -GroupCategory Security -GroupScope Global -DisplayName $ReadAccess -Path $SecurityGRP -Description 'Auto create script'
     }

    
    
     #$acl = Get-Acl $FolderName
     #$accesrule = New-Object System.Security.AccessControl.FileSystemAccessRule("PRAKTIKANT\Users","read","Deny")
     #$acl.RemoveAccessRule($accesrule)
     #Set-Acl -Path $FolderName -AclObject $acl
<#
     $acl = Get-Acl $FolderName
     $accessrule = New-Object System.Security.AccessControl.FileSystemAccessRule("PRAKTIKANT\Users","FullControl","deny")
     $acl.RemoveAccessRule($accessrule)
     $acl | Set-Acl $FolderName
#>
     New-SmbShare -Name $Folder -Path $FolderName -FullAccess 'Domain Admins' -ChangeAccess $ChangeAccess -ReadAccess $ReadAccess
     $aclOne = Get-Acl $FolderName
     $aclOne.SetAccessRuleProtection($True, $True)
     Set-Acl -Path $FolderName -AclObject $aclOne
     #get-ntfsacces -path $FolderName -Account "Builtin\Users"


     $permissionOne = "Praktikant\SEC-$Folder-RW","Read, Write","ContainerInherit,ObjectInherit","None","Allow"
     $AccessRuleOne = New-Object System.Security.AccessControl.FileSystemAccessRule $permissionOne
     $aclOne.SetAccessRule($AccessRuleOne)
     $aclOne | Set-Acl $FolderName
     
     Set-Acl -Path $FolderName -AclObject $aclOne

     $aclTwo = Get-Acl $FolderName
     $permissionTwo = "Praktikant\SEC-$Folder-RO","Read","ContainerInherit,ObjectInherit","None","Allow"
     $AccessRuleTwo = New-Object System.Security.AccessControl.FileSystemAccessRule $permissionTwo
     $aclTwo.SetAccessRule($AccessRuleTwo)
     $aclTwo | Set-Acl $FolderName


 }
}




