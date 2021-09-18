
Get-OwaVirtualDirectory ‘\\$server\owa (Default Web Site)’ | fl
Remove-OwaVirtualDirectory ‘\\$server\owa (Default Web Site)’
New-OwaVirtualDirectory -WebSiteName ‘Default Web Site’