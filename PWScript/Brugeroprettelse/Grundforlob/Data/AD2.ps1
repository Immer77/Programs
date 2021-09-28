#-----------------------------------------------------------
# 
#
#-----------------------------------------------------------
CLS
#Laver en variabel der angiver den Path Master OU'en har
$filename = "C:\Powershell\Data\DefaultOU.txt"
#Læser det fil data der er i filen og ligger det ind i variablen til brug senere hen
$FileData = Get-Content $filename

$jobType = $FileData[0].Split(";") #Vi tager her og benytter .Split til at opdele det information vi har fx OU;Security group.
$funcType = $jobType[0] #Her bliver den assigned til RootOU (Starter ved index 0 fordi sådan er det)

$RootOU   = $jobType[1]

$jobType = $FileData[1].Split(";")

Write-Host "Enter the Customer Name to create:" -ForegroundColor Yellow -NoNewline
$Customer = Read-Host  
if (!$Customer) {exit 0}

Write-Host "Create OU (Yes/No):" -ForegroundColor Yellow -NoNewline
$CreateOU = Read-Host  
if (!$CreateOU) {exit 0}

Write-Host "Create Users (Yes/No):" -ForegroundColor Yellow -NoNewline
$CreateUsers= Read-Host  
if (!$CreateUsers) {exit 0}

#Create the Customer in the ADUnder OU RootOU
If ($CreateOU.ToUpper() -eq "YES")
{ 
 New-ADOrganizationalUnit -Name $Customer -Path $RootOU -ProtectedFromAccidentalDeletion $false
 $RootOU = "OU="+$Customer+","+$RootOU
 foreach($FileLineData in $FileData)
 {
  $Data = $FileLineData.Split(";")
  if($data[0] -eq "OU")
  { New-ADOrganizationalUnit -Name $data[1] -Path $RootOU -ProtectedFromAccidentalDeletion $false }
  if($data[0] -eq "SG")
  {
   #DEBUG  
   #$RootOU
   #$data[1]
   #$data[2]
   $SGroup=$Data[1].Replace("%Customer%",$Customer)
   $SGOU=$Data[2]
   $RootOU1 = "OU="+$SGOU+","+$RootOU
   New-ADGroup -Name $SGroup -GroupCategory Security -GroupScope Global -DisplayName $SGroup -Path $RootOU1
  }
 }
}

If ($CreateUsers.ToUpper() -eq "YES")
{ 
 Write-Host "Now Running Create Users for Customer $Customer : " -ForegroundColor Green 
 $userfilename = "C:\Powershell\Data\%Customer%-Users.txt".Replace("%Customer%",$Customer)
 $filedata = get-content $userfilename | Select-Object -Skip 1
 foreach($user in $filedata)
 {
 $data2 = $user.Split(";")
 $FN = $data2[0]
 $INIT = $data2[1]
 $LN = $data2[2]
 $UN = $data2[3]
 $DN = $data2[4]
 $PWD = ConvertTo-SecureString -String $data2[5] -AsPlainText -force 
 $EMAIL = $data2[6]
 $TLF = $data2[7]
 $MOBIL = $data2[8]
 $OFFICE = $data2[9]
 $JOB = $data2[10]
 $DEP = $data2[11]
 $FULLNAME = $FN+" "+$LN
 $USEROU = "OU=User,OU=%Customer%,OU=Hosting,DC=praktikant,DC=local".Replace("%Customer%",$Customer)
 $Sam = $Customer+"_"+$INIT

 New-ADUser -Name $FullName `
 -GivenName $FN `
 -Surname $LN `
 -Initials $INIT `
 -DisplayName $FullName `
 -Office $Office `
 -Company $Customer `
 -Department $DEP `
 -MobilePhone $MOBIL `
 -HomePhone  $TLF `
 -OfficePhone  $TLF `
 -Title $JOB `
 -AccountPassword $PWD `
 -UserPrincipalName $EMAIL `
 -SamAccountName $SAM `
 -EmailAddress $EMAIL `
 -path $UserOU `
 -Enabled $true 
  
 }
}
