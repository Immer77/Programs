#-----------------------------------------------------------
# 
#
#-----------------------------------------------------------
CLS
#Laver en variabel der angiver den Path Master OU'en har
$filename = "D:\Grundforlob\Data\DefaultOU.txt"
#Læser det fil data der er i filen og ligger det ind i variablen til brug senere hen
$FileData = Get-Content $filename

$jobType = $FileData[0].Split(";") #Vi tager her og benytter .Split til at opdele det information vi har fx OU;Security group.
$funcType = $jobType[0] #Her bliver den assigned til RootOU (Starter ved index 0 fordi sådan er det)

$RootOU   = $jobType[1]  #RootOU bliver sat til OU ved indeks 1

$jobType = $FileData[1].Split(";") #For at få adskilt OU;Security group som eksempel benytter vi funktionen .Split(";") til at splitte dem af imellem og adskille dem

Write-Host "Enter the Customer Name to create:" -ForegroundColor Yellow -NoNewline #Vi skal her have bruger input for at lave det navn kunden skal have
$Customer = Read-Host  #Læser linjen ovenover og assigner den til en variabel
if (!$Customer) {exit 0} #Dette er bare en exit commando der benyttes såfremt der ikke bliver skrevet noget user input

Write-Host "Create OU (Yes/No):" -ForegroundColor Yellow -NoNewline # Samme som det ovenover her er det bare et OU der bliver kre
$CreateOU = Read-Host  #Skaber OU ud fra den fil vi har fået, i dette tilfælde er det DefaultOU filen
if (!$CreateOU) {exit 0} #Dette er bare en exit commando der benyttes såfremt der ikke bliver skrevet noget user input

Write-Host "Create Users (Yes/No):" -ForegroundColor Yellow -NoNewline
$CreateUsers= Read-Host  
if (!$CreateUsers) {exit 0} #Det er det samme som ovenover, de cmdlets der bliver benyttet 

#Create the Customer in the ADUnder OU RootOU
If ($CreateOU.ToUpper() -eq "YES") #Her tager man det og sætter det i en If statement, for at alt skal være til at fungere gør vi det til uppercase
{ 
 New-ADOrganizationalUnit -Name $Customer -Path $RootOU -ProtectedFromAccidentalDeletion $false #Laver ny OU under AD'et
 $RootOU = "OU="+$Customer+","+$RootOU #Her indkorperer vi kundens navn til at lave et OU under vores Hosting OU
 foreach($FileLineData in $FileData) 
 {
  $Data = $FileLineData.Split(";") #Samme som tidligere, for at opdele og lave OU'et hentet fra en fil så splitter vi den ved ';'
  if($data[0] -eq "OU") #Er det = OU bliver der oprettet et OU, hvis det er = SG er det en Security grp
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
 Write-Host "Now Running Create Users for Customer $Customer : " -ForegroundColor Green  #Create User som hentes fra filen hvor man tager det kunde navn der var lavet tidligere
 $userfilename = "D:\Grundforlob\Data\%Customer%-Users.txt".Replace("%Customer%",$Customer) #Bruger 'Replace' til at putte kundens navn ind i filen
 $filedata = get-content $userfilename | Select-Object -Skip 1 #Skip index 0 da det ikke skal bruges tjek evt. fil k1 Users hvis der vil vides mere
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
  <#Det sidste der bliver foretaget her er at der bliver plottet bruger ind i vores domæne under de forskellige AD's,
  alle oplysninger kommer fra filer der bliver scannet ind #>
 }
}
