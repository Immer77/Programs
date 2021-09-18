#Elevate to administrator if not already
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`"";
    exit;
}

#Set DNS authorized Zone in domain
Add-DnsServerPrimaryZone -NetworkID 192.168.242.0/24 -ZoneFile “192.168.242.10.in-addr.arpa.dns”

#Set forwarder to 8.8.8.8
Add-DnsServerForwarder -IPAddress 8.8.8.8 -PassThru

#Install DHCP and tools
Install-WindowsFeature DHCP -IncludeManagementTools 
#authorise DHCP in domain
netsh dhcp add securitygroups 
#restart dhcp service
restart-service dhcpserver 
#DHCP range for main LAN
Add-DHCPServerv4Scope -Name “InternLan” -StartRange 192.168.242.100 -EndRange 192.168.242.200 -SubnetMask 255.255.255.0 -State Active
#set dhcp scope 
Set-DhcpServerv4Scope -ScopeId 192.168.242.0 -LeaseDuration 1.00:00:00
#set dhcp options with values for domain and dns and router. 
Set-DHCPServerv4OptionValue -ScopeID 192.168.242.0 -DnsDomain Test-Environment.local -DnsServer 192.168.242.10 -Router 192.168.242.1 
#Set domain options for dhcp
Add-DhcpServerInDC -DnsName Test-Environment.local -IpAddress 192.168.242.10 
#set dhcp install as completed
Set-ItemProperty –Path registry::HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\ServerManager\Roles\12 –Name ConfigurationState –Value 2
#restart dhcp service
Restart-service dhcpserver
