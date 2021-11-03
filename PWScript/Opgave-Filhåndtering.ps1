$mapper = @('mappe1','mappe2')

$mapper | ForEach-Object {New-item -Path C:\School\Opgave1\$_ -ItemType Directory}

for ($i = 0; $i -lt 2; $i++) {
    New-Item -Path C:\School\Opgave1\mappe1\test$i.txt
}

Move-Item -Path C:\School\Opgave1\mappe1\*.txt -Destination C:\School\Opgave1\mappe2\ -ErrorAction SilentlyContinue

$folderinfo = Get-ChildItem C:\School\Opgave1\mappe1 | Measure-Object

if ($folderinfo.Count -eq 0) {
    Remove-Item -Path C:\School\Opgave1\mappe1 -Force -Recurse
}
else {
    Write-Host "Der er stadig filer i denne mappe venligst slet dem først"
}
Get-ChildItem C:\School\Opgave1\mappe2\*.txt | Rename-Item -NewName {$_.Name -replace 'test','nytest'}
$bool = $true
while ($bool) {
    Clear-Host
    $uinput = Read-Host "Hvordan vil du vurdere dette script fra 1-5"
    switch ($uinput) {
        "1" {$bool = $true; break}
        "2" {$bool = $true; break}
        "3" {$bool = $true; break}
        "4" {$bool = $true; break}
        "5" {$bool = $false; break}
    }

}
Write-Host("Tak for de fine ord")
<#Ovenstående Script opfylder alle kravene.
Den starter med at ligge de 2 mapper der skal laves i et "Array", hvorefter den looper igennem det array og laver mapper dertil.
Derefter skaber vi de filer der skal ligges i mappen, det kunne være de 26 som der står beskrevet inde på Moodle, jeg har valgt 2 da det er nemmere at arbejde med.
En simpel ændring i For-Loopet på linje 5 hvor du ændrer 2 til 26 vil klar det.
Efterfølgende flytter du alle .txt filer over til den anden mappe destination.
Vi skal have slettet mappe1 efter den bliver flyttet over og er tom, så først tjekker vi lige om folderen er tom med $folderinfo.count
Hvis der er 0 filer i den bliver den slettet, hvis ikke kommer den med en fejl.
Til sidst bliver der omdøbet filerne så de bliver til 'nytest' fremfor 'test' samt en feedback hvor du kun får lov til at komme ud hvis du giver den 5/5
#>

