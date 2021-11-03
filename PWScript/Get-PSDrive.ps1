#Commandoer til at finde information

#Søger i alle kommandoer efter bestemt ord du putter imellem * *
Get-Command *network*

#Get-PSDrive information
Get-PSDrive

#Få information på et bestemt navn eks. C:Drevet
Get-PSDrive C

#Drives der er 
Get-PSDrive -PSProvider FileSystem

#Check if drives are in use
if (Get-PSDrive X -ErrorAction SilentlyContinue) {
    Write-Host 'The X: drive is already in use.'
} else {
    New-PSDrive -Name X -PSProvider Registry -Root HKLM:\SOFTWARE
}

