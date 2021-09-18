Import-Module activedirectory
#Dialogboks til valg af csv fil.
$dialog = New-Object -TypeName System.Windows.Forms.OpenFileDialog

$dialog.AddExtension = $true
$dialog.Filter = 'CSV file (*.csv)|*.csv|All Files|*.*'
$dialog.Multiselect = $false
$dialog.FilterIndex = 0
$dialog.InitialDirectory = ".\"
$dialog.RestoreDirectory = $true
$dialog.ShowReadOnly = $true
$dialog.ReadOnlyChecked = $false
$dialog.Title = 'Vælg en CSV fil'

$result = $dialog.ShowDialog()

if ($result = 'OK')
{
    $filename = $dialog.FileName
    $readonly = $dialog.ReadOnlyChecked
    if ($readonly) { $mode = 'read-only' } else { 'read-write' }
   
} 


$ADUsers = Import-Csv "$filename"

ForEach ($User in $ADUsers) {


    $username = $User.Username
    $password = $User.Password
    $firstname = $User.FirstName
    $lastname = $User.LastName
    $OU = $User.OU 
    $jobtitle = $User.Jobtitle
    $company = $User.Company
    $department = $User.Department
    $securitygroup = $User.Group
    $UPN = "EI-LAB.local"

    #if (Get-ADUser -F { SamAccountName -eq $username }) { Write-Warning "En bruger med brugernavnet $username eksisterer allerede i Active Directory." }
    #else {
        #$GroupExists = Get-ADGroup -Identity "$securitygroup"             
        #if ($GroupExists -ne $null) { New-ADGroup -Name $User.Group -SamAccountName $User.Group -GroupCategory Security -GroupScope Global -DisplayName $User.GroupDisplay -Path $User.GroupOU -Description $User.GroupDiscription }
        #else { Write-Warning "En gruppe med Gruppenavnet $securitygroup eksisterer allerede i Active Directory." }

        New-ADUser `
            -SamAccountName $username `
            -UserPrincipalName "$username@$UPN" `
            -Name "$firstname $lastname" `
            -GivenName $firstname `
            -Surname $lastname `
            -Initials $initials `
            -Enabled $True `
            -DisplayName "$lastname, $firstname" `
            -Path $OU `
            -City $city `
            -Company $company `
            -Title $jobtitle `
            -Department $department `
            -AccountPassword (ConvertTo-secureString $User.Password -AsPlainText -Force) `
            -PasswordNeverExpires $true

        Add-ADGroupMember -Identity $securitygroup  -Members "$username"
        Write-Host "Brugeren $username er blevet oprettet og tilføjet til gruppen $securitygroup."
        
    }
#}

Read-Host -Prompt "Tryk Enter for at afslutte"








