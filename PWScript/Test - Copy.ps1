$Version = "1.0"

######################################################################################################
Add-Type -AssemblyName System.Windows.Forms
Add-Type -Name Window -Namespace Console -MemberDefinition '
[DllImport("Kernel32.dll")]
public static extern IntPtr GetConsoleWindow();

[DllImport("user32.dll")]
public static extern bool ShowWindow(IntPtr hWnd, Int32 nCmdShow);
'
[System.Windows.Forms.Application]::EnableVisualStyles()
Function MainWindow{
    $Global:MainForm                        = New-Object system.Windows.Forms.Form
    $Global:MainForm.ClientSize             = '750,400'
    $Global:MainForm.text                   = "VPN Connector 3000"
    $Global:MainForm.TopMost                = $false

    $Global:VPNInput                        = New-Object system.Windows.Forms.ComboBox
    $Global:VPNInput.width                  = 275
    $Global:VPNInput.height                 = 76
    $Global:VPNInput.location               = New-Object System.Drawing.Point(7,12)
    $Global:VPNInput.Font                   = 'Microsoft Sans Serif,10,style=Bold'
    $Global:VPNInput.AutoCompleteMode       = 'Append' 
    $Global:VPNInput.AutoCompleteSource     = 'CustomSource'
    $Global:VPNInput.Sorted                 = $true

    $Global:Connect                         = New-Object system.Windows.Forms.Button
    $Global:Connect.text                    = "Connect"
    $Global:Connect.width                   = 126
    $Global:Connect.height                  = 30
    $Global:Connect.location                = New-Object System.Drawing.Point(290,9)
    $Global:Connect.Font                    = 'Microsoft Sans Serif,10,style=Bold'
    $Global:Connect.ForeColor               = "#12b836"

    $Global:Disconnect                         = New-Object system.Windows.Forms.Button
    $Global:Disconnect.text                    = "Disconnect"
    $Global:Disconnect.width                   = 126
    $Global:Disconnect.height                  = 30
    $Global:Disconnect.location                = New-Object System.Drawing.Point(290,45)
    $Global:Disconnect.Font                    = 'Microsoft Sans Serif,10,style=Bold'
    $Global:Disconnect.ForeColor               = "Red"

    $Global:CLabel                          = New-Object system.Windows.Forms.Label
    $Global:CLabel.text                     = "VPN Status:"
    $Global:CLabel.AutoSize                 = $true
    $Global:CLabel.width                    = 25
    $Global:CLabel.height                   = 10
    $Global:CLabel.location                 = New-Object System.Drawing.Point(7,40)
    $Global:CLabel.Font                     = 'Microsoft Sans Serif,10'

    $Global:CLabelStatus                          = New-Object system.Windows.Forms.Label
    $Global:CLabelStatus.text                     = ""
    $Global:CLabelStatus.AutoSize                 = $true
    $Global:CLabelStatus.width                    = 25
    $Global:CLabelStatus.height                   = 10
    $Global:CLabelStatus.location                 = New-Object System.Drawing.Point(84,41)
    $Global:CLabelStatus.Font                     = 'Microsoft Sans Serif,10,style=Italic'
    $Global:CLabelStatus.ForeColor                = 'Red'

    $Global:VPNLabel                         = New-Object system.Windows.Forms.Label
    $Global:VPNLabel.text                     = "Connected to:"
    $Global:VPNLabel.AutoSize                 = $true
    $Global:VPNLabel.width                    = 25
    $Global:VPNLabel.height                   = 10
    $Global:VPNLabel.location                 = New-Object System.Drawing.Point(7,62)
    $Global:VPNLabel.Font                     = 'Microsoft Sans Serif,10'

    $Global:VPNlabel1                          = New-Object system.Windows.Forms.Label
    $Global:VPNlabel1.text                     = ""
    $Global:VPNlabel1.AutoSize                 = $true
    $Global:VPNlabel1.width                    = 25
    $Global:VPNlabel1.height                   = 10
    $Global:VPNlabel1.location                 = New-Object System.Drawing.Point(95,62)
    $Global:VPNlabel1.Font                     = 'Microsoft Sans Serif,10'

    $Global:VersionLabel                          = New-Object system.Windows.Forms.Label
    $Global:VersionLabel.text                     = "Version: $Version"
    $Global:VersionLabel.AutoSize                 = $true
    $Global:VersionLabel.width                    = 25
    $Global:VersionLabel.height                   = 10
    $Global:VersionLabel.location                 = New-Object System.Drawing.Point(7,380)
    $Global:VersionLabel.Font                     = 'Microsoft Sans Serif,10,style=Italic'
    $Global:VersionLabel.ForeColor                = "Gray"

    $Global:AddRDPC                   = New-Object system.Windows.Forms.Button
    $Global:AddRDPC.text              = "Add RDP"
    $Global:AddRDPC.width             = 124
    $Global:AddRDPC.height            = 50
    $Global:AddRDPC.location          = New-Object System.Drawing.Point(292,282)
    $Global:AddRDPC.Font              = 'Microsoft Sans Serif,10,style=Bold'

    $Global:AddConnection                   = New-Object system.Windows.Forms.Button
    $Global:AddConnection.text              = "Add Cisco VPN Connection"
    $Global:AddConnection.width             = 124
    $Global:AddConnection.height            = 50
    $Global:AddConnection.location          = New-Object System.Drawing.Point(292,103)
    $Global:AddConnection.Font              = 'Microsoft Sans Serif,10,style=Bold'

    $Global:Update                   = New-Object system.Windows.Forms.Button
    $Global:Update.text              = "Add Fortigate VPN Connection"
    $Global:Update.width             = 124
    $Global:Update.height            = 50
    $Global:Update.location          = New-Object System.Drawing.Point(292,162)
    $Global:Update.Font              = 'Microsoft Sans Serif,10,style=Bold'

    $Global:Changepass                   = New-Object system.Windows.Forms.Button
    $Global:Changepass.text              = "Change Credentials"
    $Global:Changepass.width             = 124
    $Global:Changepass.height            = 50
    $Global:Changepass.location          = New-Object System.Drawing.Point(292,222)
    $Global:Changepass.Font              = 'Microsoft Sans Serif,10,style=Bold'

    $Global:AddHost                   = New-Object system.Windows.Forms.Button
    $Global:AddHost.text              = "Add Host"
    $Global:AddHost.width             = 124
    $Global:AddHost.height            = 50
    $Global:AddHost.location          = New-Object System.Drawing.Point(292,341)
    $Global:AddHost.Font              = 'Microsoft Sans Serif,10,style=Bold'

    $Global:ListView                       = New-Object system.Windows.Forms.ListView
    $Global:ListView.view                  = "Details"
    $Global:ListView.text                  = "listView"
    $Global:listView.Sorting               = "Ascending"
    $Global:ListView.width                 = 315
    $Global:ListView.height                = 261
    $Global:ListView.location              = New-Object System.Drawing.Point(424,10)
    $Global:ListView.Columns.Add("Server      ") | Out-Null
    $Global:ListView.Columns.Add("Roles")  | Out-Null
    $Global:ListView.AutoResizeColumns(1)
    $Global:listView.FullRowSelect         = $true

    $Global:ListViewHost                       = New-Object system.Windows.Forms.ListView
    $Global:ListViewHost.view                  = "Details"
    $Global:ListViewHost.text                  = "listView"
    $Global:ListViewHost.Sorting               = "Ascending"
    $Global:ListViewHost.width                 = 315
    $Global:ListViewHost.height                = 108
    $Global:ListViewHost.location              = New-Object System.Drawing.Point(424,283)
    $Global:ListViewHost.Columns.Add("Host      ") | Out-Null
    $Global:ListViewHost.Columns.Add("Address")  | Out-Null
    $Global:ListViewHost.AutoResizeColumns(1)
    $Global:ListViewHost.FullRowSelect         = $true

    $MainForm.controls.AddRange(@($VPNInput,$Connect,$Disconnect,$Clabel,$CLabelStatus,$VPNLabel,$VPNlabel1,$AddRDPC,$AddConnection,$Update,$ChangePass,$AddHost,$ListView,$ListViewHost,$VersionLabel))
}

Function AddCiscoWindow {
    $Global:NewConnectionForm                            = New-Object system.Windows.Forms.Form
    $Global:NewConnectionForm.ClientSize                 = '281,283'
    $Global:NewConnectionForm.text                       = "Add New Connection"
    $Global:NewConnectionForm.TopMost                    = $false

    $Global:Label0                          = New-Object system.Windows.Forms.Label
    $Global:Label0.text                     = "VPN Name"
    $Global:Label0.AutoSize                 = $true
    $Global:Label0.width                    = 25
    $Global:Label0.height                   = 10
    $Global:Label0.location                 = New-Object System.Drawing.Point(9,18)
    $Global:Label0.Font                     = 'Microsoft Sans Serif,10,style=Bold'

    $Global:Label1                          = New-Object system.Windows.Forms.Label
    $Global:Label1.text                     = "VPN URL"
    $Global:Label1.AutoSize                 = $true
    $Global:Label1.width                    = 25
    $Global:Label1.height                   = 10
    $Global:Label1.location                 = New-Object System.Drawing.Point(9,48)
    $Global:Label1.Font                     = 'Microsoft Sans Serif,10'

    $Global:Label2                          = New-Object system.Windows.Forms.Label
    $Global:Label2.text                     = "Username"
    $Global:Label2.AutoSize                 = $true
    $Global:Label2.width                    = 25
    $Global:Label2.height                   = 10
    $Global:Label2.location                 = New-Object System.Drawing.Point(8,78)
    $Global:Label2.Font                     = 'Microsoft Sans Serif,10'

    $Global:Label3                          = New-Object system.Windows.Forms.Label
    $Global:Label3.text                     = "Password"
    $Global:Label3.AutoSize                 = $true
    $Global:Label3.width                    = 25
    $Global:Label3.height                   = 10
    $Global:Label3.location                 = New-Object System.Drawing.Point(8,107)
    $Global:Label3.Font                     = 'Microsoft Sans Serif,10'

    $Global:Label4                          = New-Object system.Windows.Forms.Label
    $Global:Label4.text                     = "SMSPasscode"
    $Global:Label4.AutoSize                 = $true
    $Global:Label4.width                    = 25
    $Global:Label4.height                   = 10
    $Global:Label4.location                 = New-Object System.Drawing.Point(8,166)
    $Global:Label4.Font                     = 'Microsoft Sans Serif,10'

    $Global:Label5                          = New-Object system.Windows.Forms.Label
    $Global:Label5.text                     = "Is MFA Enabled?"
    $Global:Label5.AutoSize                 = $true
    $Global:Label5.width                    = 25
    $Global:Label5.height                   = 10
    $Global:Label5.location                 = New-Object System.Drawing.Point(8,195)
    $Global:Label5.Font                     = 'Microsoft Sans Serif,10,style=Bold'
    $Global:Label5.ForeColor                = "#189d23"

    $Global:Label6                          = New-Object system.Windows.Forms.Label
    $Global:Label6.text                     = "Group Number"
    $Global:Label6.AutoSize                 = $true
    $Global:Label6.width                    = 25
    $Global:Label6.height                   = 10
    $Global:Label6.location                 = New-Object System.Drawing.Point(8,136)
    $Global:Label6.Font                     = 'Microsoft Sans Serif,10,'

    $Global:TB_Name                         = New-Object system.Windows.Forms.TextBox
    $Global:TB_Name.multiline               = $false
    $Global:TB_Name.width                   = 163
    $Global:TB_Name.height                  = 20
    $Global:TB_Name.location                = New-Object System.Drawing.Point(108,13)
    $Global:TB_Name.Font                    = 'Microsoft Sans Serif,10'

    $Global:TB_AddVPN                       = New-Object system.Windows.Forms.TextBox
    $Global:TB_AddVPN.multiline             = $false
    $Global:TB_AddVPN.width                 = 163
    $Global:TB_AddVPN.height                = 20
    $Global:TB_AddVPN.location              = New-Object System.Drawing.Point(108,43)
    $Global:TB_AddVPN.Font                  = 'Microsoft Sans Serif,10'

    $Global:TB_AddUS                        = New-Object system.Windows.Forms.TextBox
    $Global:TB_AddUS.multiline              = $false
    $Global:TB_AddUS.width                  = 163
    $Global:TB_AddUS.height                 = 20
    $Global:TB_AddUS.location               = New-Object System.Drawing.Point(108,74)
    $Global:TB_AddUS.Font                   = 'Microsoft Sans Serif,10'

    $Global:TB_AddPW                        = New-Object system.Windows.Forms.TextBox
    $Global:TB_AddPW.multiline              = $false
    $Global:TB_AddPW.width                  = 163
    $Global:TB_AddPW.height                 = 20
    $Global:TB_AddPW.location               = New-Object System.Drawing.Point(108,103)
    $Global:TB_AddPW.Font                   = 'Microsoft Sans Serif,10'

    $Global:TB_AddGroup                     = New-Object system.Windows.Forms.TextBox
    $Global:TB_AddGroup.multiline           = $false
    $Global:TB_AddGroup.width               = 144
    $Global:TB_AddGroup.height              = 20
    $Global:TB_AddGroup.location            = New-Object System.Drawing.Point(108,133)
    $Global:TB_AddGroup.Font                = 'Microsoft Sans Serif,10'
    $Global:TB_AddGroup.Enabled             = $False

    $Global:TB_AddSMS                       = New-Object system.Windows.Forms.TextBox
    $Global:TB_AddSMS.multiline             = $false
    $Global:TB_AddSMS.width                 = 144
    $Global:TB_AddSMS.height                = 20
    $Global:TB_AddSMS.location              = New-Object System.Drawing.Point(108,162)
    $Global:TB_AddSMS.Font                  = 'Microsoft Sans Serif,10'
    $Global:TB_AddSMS.Enabled               = $False

    $Global:CB_Group                         = New-Object system.Windows.Forms.CheckBox
    $Global:CB_Group.AutoSize                = $false
    $Global:CB_Group.width                   = 20
    $Global:CB_Group.height                  = 20
    $Global:CB_Group.location                = New-Object System.Drawing.Point(256,134)
    $Global:CB_Group.Font                    = 'Microsoft Sans Serif,10'

    $Global:CB_SMS                          = New-Object system.Windows.Forms.CheckBox
    $Global:CB_SMS.AutoSize                 = $false
    $Global:CB_SMS.width                    = 20
    $Global:CB_SMS.height                   = 20
    $Global:CB_SMS.location                 = New-Object System.Drawing.Point(256,164)
    $Global:CB_SMS.Font                     = 'Microsoft Sans Serif,10'

    $Global:CB_TwoF                         = New-Object system.Windows.Forms.CheckBox
    $Global:CB_TwoF.AutoSize                = $false
    $Global:CB_TwoF.width                   = 20
    $Global:CB_TwoF.height                  = 20
    $Global:CB_TwoF.location                = New-Object System.Drawing.Point(256,194)
    $Global:CB_TwoF.Font                    = 'Microsoft Sans Serif,10'

    $Global:CreateVPN                       = New-Object system.Windows.Forms.Button
    $Global:CreateVPN.text                  = "Add Connection"
    $Global:CreateVPN.width                 = 261
    $Global:CreateVPN.height                = 54
    $Global:CreateVPN.location              = New-Object System.Drawing.Point(8,219)
    $Global:CreateVPN.Font                  = 'Microsoft Sans Serif,10'

    $NewConnectionForm.controls.AddRange(@($label0, $Label1,$Label2,$Label3,$Label6,$Label4,$Label5,$TB_Name,$TB_AddVPN,$TB_AddUS,$TB_AddPW,$TB_AddGroup,$TB_AddSMS,$CreateVPN,$CB_Group,$CB_TwoF,$CB_SMS))
}

Function AddFortiWindows {
    $Global:AddFortiVPN                     = New-Object system.Windows.Forms.Form
    $Global:AddFortiVPN.ClientSize          = New-Object System.Drawing.Point(277,228)
    $Global:AddFortiVPN.text                = "Add Fortigate Connection"
    $Global:AddFortiVPN.TopMost             = $false

    $Global:FortiLabel1                     = New-Object system.Windows.Forms.Label
    $Global:FortiLabel1.text                = "VPN URL"
    $Global:FortiLabel1.AutoSize            = $true
    $Global:FortiLabel1.width               = 25
    $Global:FortiLabel1.height              = 10
    $Global:FortiLabel1.location            = New-Object System.Drawing.Point(9,48)
    $Global:FortiLabel1.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:FortiLabel3                     = New-Object system.Windows.Forms.Label
    $Global:FortiLabel3.text                = "Username"
    $Global:FortiLabel3.AutoSize            = $true
    $Global:FortiLabel3.width               = 25
    $Global:FortiLabel3.height              = 10
    $Global:FortiLabel3.location            = New-Object System.Drawing.Point(9,78)
    $Global:FortiLabel3.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:FortiLabel4                     = New-Object system.Windows.Forms.Label
    $Global:FortiLabel4.text                = "Password"
    $Global:FortiLabel4.AutoSize            = $true
    $Global:FortiLabel4.width               = 25
    $Global:FortiLabel4.height              = 10
    $Global:FortiLabel4.location            = New-Object System.Drawing.Point(9,107)
    $Global:FortiLabel4.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
    
    $Global:Forti_Label5                    = New-Object system.Windows.Forms.Label
    $Global:Forti_Label5.text               = "VPN Name"
    $Global:Forti_Label5.AutoSize           = $true
    $Global:Forti_Label5.width              = 25
    $Global:Forti_Label5.height             = 10
    $Global:Forti_Label5.location           = New-Object System.Drawing.Point(9,18)
    $Global:Forti_Label5.Font               = New-Object System.Drawing.Font('Microsoft Sans Serif',10,[System.Drawing.FontStyle]([System.Drawing.FontStyle]::Bold))

    $Global:FortiLabel6                     = New-Object system.Windows.Forms.Label
    $Global:FortiLabel6.text                = ":"
    $Global:FortiLabel6.AutoSize            = $true
    $Global:FortiLabel6.width               = 25
    $Global:FortiLabel6.height              = 10
    $Global:FortiLabel6.location            = New-Object System.Drawing.Point(207,45)
    $Global:FortiLabel6.Font                = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:FortiLabel7                     = New-Object system.Windows.Forms.Label
    $Global:FortiLabel7.text                = "Is MFA Enabled?"
    $Global:FortiLabel7.AutoSize            = $true
    $Global:FortiLabel7.width               = 25
    $Global:FortiLabel7.height              = 10
    $Global:FortiLabel7.location            = New-Object System.Drawing.Point(9,137)
    $Global:FortiLabel7.Font                = 'Microsoft Sans Serif,10,style=Bold'
    $Global:FortiLabel7.ForeColor           = "#189d23"

    $Global:Forti_TB1                       = New-Object system.Windows.Forms.TextBox
    $Global:Forti_TB1.multiline             = $false
    $Global:Forti_TB1.width                 = 182
    $Global:Forti_TB1.height                = 20
    $Global:Forti_TB1.location              = New-Object System.Drawing.Point(88,13)
    $Global:Forti_TB1.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:Forti_TB2                       = New-Object system.Windows.Forms.TextBox
    $Global:Forti_TB2.multiline             = $false
    $Global:Forti_TB2.width                 = 120
    $Global:Forti_TB2.height                = 20
    $Global:Forti_TB2.location              = New-Object System.Drawing.Point(87,43)
    $Global:Forti_TB2.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:Forti_TB3                       = New-Object system.Windows.Forms.TextBox
    $Global:Forti_TB3.text                  = "443"
    $Global:Forti_TB3.multiline             = $false
    $Global:Forti_TB3.width                 = 34
    $Global:Forti_TB3.height                = 20
    $Global:Forti_TB3.location              = New-Object System.Drawing.Point(216,43)
    $Global:Forti_TB3.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
    $Global:Forti_TB3.Enabled               = $false

    $Global:Forti_TB4                       = New-Object system.Windows.Forms.TextBox
    $Global:Forti_TB4.multiline             = $false
    $Global:Forti_TB4.width                 = 182
    $Global:Forti_TB4.height                = 20
    $Global:Forti_TB4.location              = New-Object System.Drawing.Point(88,74)
    $Global:Forti_TB4.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:Forti_TB5                       = New-Object system.Windows.Forms.TextBox
    $Global:Forti_TB5.multiline             = $false
    $Global:Forti_TB5.width                 = 182
    $Global:Forti_TB5.height                = 20
    $Global:Forti_TB5.location              = New-Object System.Drawing.Point(88,103)
    $Global:Forti_TB5.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:Forti_CB1                       = New-Object system.Windows.Forms.CheckBox
    $Global:Forti_CB1.AutoSize              = $false
    $Global:Forti_CB1.width                 = 18
    $Global:Forti_CB1.height                = 20
    $Global:Forti_CB1.location              = New-Object System.Drawing.Point(255,45)
    $Global:Forti_CB1.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:Forti_CB2                       = New-Object system.Windows.Forms.CheckBox
    $Global:Forti_CB2.AutoSize              = $false
    $Global:Forti_CB2.width                 = 18
    $Global:Forti_CB2.height                = 20
    $Global:Forti_CB2.location              = New-Object System.Drawing.Point(255,135)
    $Global:Forti_CB2.Font                  = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:Forti_Button1                   = New-Object system.Windows.Forms.Button
    $Global:Forti_Button1.text              = "Add Connection"
    $Global:Forti_Button1.width             = 261
    $Global:Forti_Button1.height            = 55
    $Global:Forti_Button1.location          = New-Object System.Drawing.Point(8,163)
    $Global:Forti_Button1.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $AddFortiVPN.controls.AddRange(@($FortiLabel1,$FortiLabel3,$FortiLabel4,$Forti_Label5,$FortiLabel6,$FortiLabel7,$Forti_TB1,$Forti_TB2,$Forti_TB3,$Forti_CB1,$Forti_CB2,$Forti_TB4,$Forti_TB5,$Forti_Button1))  
}

Function AddRDPWindow {
    $Global:CreateRDP_Form                  = New-Object system.Windows.Forms.Form
    $Global:CreateRDP_Form.ClientSize       = '297,250'
    $Global:CreateRDP_Form.text             = "Create RDP"
    $Global:CreateRDP_Form.TopMost          = $false

    $Global:RDP_INPUT_COMBO                        = New-Object system.Windows.Forms.ComboBox
    $Global:RDP_INPUT_COMBO.width                  = 278
    $Global:RDP_INPUT_COMBO.height                 = 20
    $Global:RDP_INPUT_COMBO.location               = New-Object System.Drawing.Point(7,11)
    $Global:RDP_INPUT_COMBO.Font                   = 'Microsoft Sans Serif,10,style=Bold'
    $Global:RDP_INPUT_COMBO.AutoCompleteMode       = 'Append' 
    $Global:RDP_INPUT_COMBO.AutoCompleteSource     = 'CustomSource'
    $Global:RDP_INPUT_COMBO.Sorted                 = $true

    $Global:RDP_NAME_LABEL                  = New-Object system.Windows.Forms.Label
    $Global:RDP_NAME_LABEL.text             = "Server Name"
    $Global:RDP_NAME_LABEL.AutoSize         = $true
    $Global:RDP_NAME_LABEL.width            = 25
    $Global:RDP_NAME_LABEL.height           = 10
    $Global:RDP_NAME_LABEL.location         = New-Object System.Drawing.Point(12,46)
    $Global:RDP_NAME_LABEL.Font             = 'Microsoft Sans Serif,10'

    $Global:RDP_IP_LABEL                    = New-Object system.Windows.Forms.Label
    $Global:RDP_IP_LABEL.text               = "IP Address"
    $Global:RDP_IP_LABEL.AutoSize           = $true
    $Global:RDP_IP_LABEL.width              = 25
    $Global:RDP_IP_LABEL.height             = 10
    $Global:RDP_IP_LABEL.location           = New-Object System.Drawing.Point(12,76)
    $Global:RDP_IP_LABEL.Font               = 'Microsoft Sans Serif,10'

    $Global:RDP_ROLES_LABEL                   = New-Object system.Windows.Forms.Label
    $Global:RDP_ROLES_LABEL.text               = "Server Roles"
    $Global:RDP_ROLES_LABEL.AutoSize           = $true
    $Global:RDP_ROLES_LABEL.width              = 25
    $Global:RDP_ROLES_LABEL.height             = 10
    $Global:RDP_ROLES_LABEL.location           = New-Object System.Drawing.Point(12,106)
    $Global:RDP_ROLES_LABEL.Font               = 'Microsoft Sans Serif,10'

    $Global:RDP_ROLES_LABEL1                   = New-Object system.Windows.Forms.Label
    $Global:RDP_ROLES_LABEL1.text               = "Example:        AD, DHCP, DNS..."
    $Global:RDP_ROLES_LABEL1.AutoSize           = $true
    $Global:RDP_ROLES_LABEL1.width              = 25
    $Global:RDP_ROLES_LABEL1.height             = 10
    $Global:RDP_ROLES_LABEL1.location           = New-Object System.Drawing.Point(12,130)
    $Global:RDP_ROLES_LABEL1.Font               = 'Microsoft Sans Serif,10,style=Italic'

    $Global:RDP_RDS_Label                    = New-Object system.Windows.Forms.Label
    $Global:RDP_RDS_Label.text               = "Check to add /admin for RDS servers"
    $Global:RDP_RDS_Label.AutoSize           = $true
    $Global:RDP_RDS_Label.width              = 25
    $Global:RDP_RDS_Label.height             = 10
    $Global:RDP_RDS_Label.location           = New-Object System.Drawing.Point(12,156)
    $Global:RDP_RDS_Label.Font               = 'Microsoft Sans Serif,10,style=Bold'

    $Global:SN_Input                        = New-Object system.Windows.Forms.TextBox
    $Global:SN_Input.multiline              = $false
    $Global:SN_Input.width                  = 187
    $Global:SN_Input.height                 = 20
    $Global:SN_Input.location               = New-Object System.Drawing.Point(98,44)
    $Global:SN_Input.Font                   = 'Microsoft Sans Serif,10'

    $Global:RDP_IP_Input                    = New-Object system.Windows.Forms.TextBox
    $Global:RDP_IP_Input.multiline          = $false
    $Global:RDP_IP_Input.width              = 187
    $Global:RDP_IP_Input.height             = 20
    $Global:RDP_IP_Input.location           = New-Object System.Drawing.Point(98,74)
    $Global:RDP_IP_Input.Font               = 'Microsoft Sans Serif,10'

    $Global:RDP_ROLES_INPUT                    = New-Object system.Windows.Forms.TextBox
    $Global:RDP_ROLES_INPUT.multiline          = $false
    $Global:RDP_ROLES_INPUT.width              = 187
    $Global:RDP_ROLES_INPUT.height             = 20
    $Global:RDP_ROLES_INPUT.location           = New-Object System.Drawing.Point(98,104)
    $Global:RDP_ROLES_INPUT.Font               = 'Microsoft Sans Serif,10'

    $Global:RDP_RDS_Check                   = New-Object system.Windows.Forms.CheckBox
    $Global:RDP_RDS_Check.AutoSize          = $false
    $Global:RDP_RDS_Check.width             = 25
    $Global:RDP_RDS_Check.height            = 20
    $Global:RDP_RDS_Check.location          = New-Object System.Drawing.Point(271,154)
    $Global:RDP_RDS_Check.Font              = 'Microsoft Sans Serif,10'

    $Global:RDPButton                       = New-Object system.Windows.Forms.Button
    $Global:RDPButton.text                  = "Add RDP"
    $Global:RDPButton.width                 = 279
    $Global:RDPButton.height                = 56
    $Global:RDPButton.location              = New-Object System.Drawing.Point(7,180)
    $Global:RDPButton.Font                  = 'Microsoft Sans Serif,10'

    $CreateRDP_Form.controls.AddRange(@($RDP_INPUT_COMBO,$RDP_NAME_LABEL,$RDP_IP_LABEL,$RDP_RDS_Label,$RDP_ROLES_LABEL,$RDP_ROLES_LABEL1,$SN_Input,$RDP_IP_Input,$RDP_ROLES_INPUT,$RDP_RDS_Check,$RDPButton))
}

Function AddHostWindow {
    $Global:CreateHost_Form                  = New-Object system.Windows.Forms.Form
    $Global:CreateHost_Form.ClientSize       = '297,170'
    $Global:CreateHost_Form.text             = "Add Host"
    $Global:CreateHost_Form.TopMost          = $false

    $Global:Host_INPUT_COMBO                        = New-Object system.Windows.Forms.ComboBox
    $Global:Host_INPUT_COMBO.width                  = 278
    $Global:Host_INPUT_COMBO.height                 = 20
    $Global:Host_INPUT_COMBO.location               = New-Object System.Drawing.Point(7,11)
    $Global:Host_INPUT_COMBO.Font                   = 'Microsoft Sans Serif,10,style=Bold'
    $Global:Host_INPUT_COMBO.AutoCompleteMode       = 'Append' 
    $Global:Host_INPUT_COMBO.AutoCompleteSource     = 'CustomSource'
    $Global:Host_INPUT_COMBO.Sorted                 = $true

    $Global:Host_NAME_LABEL                  = New-Object system.Windows.Forms.Label
    $Global:Host_NAME_LABEL.text             = "Host Name"
    $Global:Host_NAME_LABEL.AutoSize         = $true
    $Global:Host_NAME_LABEL.width            = 25
    $Global:Host_NAME_LABEL.height           = 10
    $Global:Host_NAME_LABEL.location         = New-Object System.Drawing.Point(12,46)
    $Global:Host_NAME_LABEL.Font             = 'Microsoft Sans Serif,10'

    $Global:Host_IP_LABEL                    = New-Object system.Windows.Forms.Label
    $Global:Host_IP_LABEL.text               = "Address"
    $Global:Host_IP_LABEL.AutoSize           = $true
    $Global:Host_IP_LABEL.width              = 25
    $Global:Host_IP_LABEL.height             = 10
    $Global:Host_IP_LABEL.location           = New-Object System.Drawing.Point(12,76)
    $Global:Host_IP_LABEL.Font               = 'Microsoft Sans Serif,10'

    $Global:Host_SN_Input                    = New-Object system.Windows.Forms.TextBox
    $Global:Host_SN_Input.multiline          = $false
    $Global:Host_SN_Input.width              = 187
    $Global:Host_SN_Input.height             = 20
    $Global:Host_SN_Input.location           = New-Object System.Drawing.Point(98,44)
    $Global:Host_SN_Input.Font               = 'Microsoft Sans Serif,10'

    $Global:Host_IP_Input                    = New-Object system.Windows.Forms.TextBox
    $Global:Host_IP_Input.multiline          = $false
    $Global:Host_IP_Input.width              = 187
    $Global:Host_IP_Input.height             = 20
    $Global:Host_IP_Input.location           = New-Object System.Drawing.Point(98,74)
    $Global:Host_IP_Input.Font               = 'Microsoft Sans Serif,10'

    $Global:HostButton                       = New-Object system.Windows.Forms.Button
    $Global:HostButton.text                  = "Add Host"
    $Global:HostButton.width                 = 279
    $Global:HostButton.height                = 56
    $Global:HostButton.location              = New-Object System.Drawing.Point(7,107)
    $Global:HostButton.Font                  = 'Microsoft Sans Serif,10'

    $CreateHost_Form.controls.AddRange(@($Host_INPUT_COMBO,$Host_NAME_LABEL,$Host_IP_LABEL,$Host_SN_Input,$Host_IP_Input,$HostButton))
}

Function ChangeCredsWindow {
    $Global:ChangePasswordForm              = New-Object system.Windows.Forms.Form
    $Global:ChangePasswordForm.ClientSize   = New-Object System.Drawing.Point(268,195)
    $Global:ChangePasswordForm.text         = "Change Credentials"
    $Global:ChangePasswordForm.TopMost      = $false

    $Global:ChangePCombo                    = New-Object system.Windows.Forms.ComboBox
    $Global:ChangePCombo.width              = 250
    $Global:ChangePCombo.height             = 20
    $Global:ChangePCombo.location           = New-Object System.Drawing.Point(7,11)
    $Global:ChangePCombo.Font               = 'Microsoft Sans Serif,10,style=Bold'
    $Global:ChangePCombo.AutoCompleteMode   = 'Append' 
    $Global:ChangePCombo.AutoCompleteSource = 'CustomSource'
    $Global:ChangePCombo.Sorted             = $true

    $Global:ChangePLabel1                   = New-Object system.Windows.Forms.Label
    $Global:ChangePLabel1.text              = "Username"
    $Global:ChangePLabel1.AutoSize          = $true
    $Global:ChangePLabel1.width             = 25
    $Global:ChangePLabel1.height            = 10
    $Global:ChangePLabel1.location          = New-Object System.Drawing.Point(7,51)
    $Global:ChangePLabel1.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:ChangePLabel2                   = New-Object system.Windows.Forms.Label
    $Global:ChangePLabel2.text              = "Password"
    $Global:ChangePLabel2.AutoSize          = $true
    $Global:ChangePLabel2.width             = 25
    $Global:ChangePLabel2.height            = 10
    $Global:ChangePLabel2.location          = New-Object System.Drawing.Point(7,83)
    $Global:ChangePLabel2.Font              = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:ChangePLabel3                   = New-Object system.Windows.Forms.Label
    $Global:ChangePLabel3.text              = "Is MFA enabled?"
    $Global:ChangePLabel3.AutoSize          = $true
    $Global:ChangePLabel3.width             = 25
    $Global:ChangePLabel3.height            = 10
    $Global:ChangePLabel3.location          = New-Object System.Drawing.Point(7,115)
    $Global:ChangePLabel3.Font              = 'Microsoft Sans Serif,10,style=Bold'
    $Global:ChangePLabel3.ForeColor         = "#189d23"

    $Global:ChangePTextBox1                 = New-Object system.Windows.Forms.TextBox
    $Global:ChangePTextBox1.multiline       = $false
    $Global:ChangePTextBox1.width           = 160
    $Global:ChangePTextBox1.height          = 20
    $Global:ChangePTextBox1.location        = New-Object System.Drawing.Point(78,46)
    $Global:ChangePTextBox1.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)
    $Global:ChangePTextBox1.Enabled         = $False

    $Global:ChangePTextBox2                 = New-Object system.Windows.Forms.TextBox
    $Global:ChangePTextBox2.multiline       = $false
    $Global:ChangePTextBox2.width           = 180
    $Global:ChangePTextBox2.height          = 20
    $Global:ChangePTextBox2.location        = New-Object System.Drawing.Point(78,78)
    $Global:ChangePTextBox2.Font            = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:ChangePCheckBox1                = New-Object system.Windows.Forms.CheckBox
    $Global:ChangePCheckBox1.AutoSize       = $false
    $Global:ChangePCheckBox1.width          = 25
    $Global:ChangePCheckBox1.height         = 20
    $Global:ChangePCheckBox1.location       = New-Object System.Drawing.Point(244,48)
    $Global:ChangePCheckBox1.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:ChangePCheckBox2                = New-Object system.Windows.Forms.CheckBox
    $Global:ChangePCheckBox2.AutoSize       = $false
    $Global:ChangePCheckBox2.width          = 25
    $Global:ChangePCheckBox2.height         = 20
    $Global:ChangePCheckBox2.location       = New-Object System.Drawing.Point(244,113)
    $Global:ChangePCheckBox2.Font           = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $Global:ChangePButton1                  = New-Object system.Windows.Forms.Button
    $Global:ChangePButton1.text             = "Change Credentials"
    $Global:ChangePButton1.width            = 252
    $Global:ChangePButton1.height           = 47
    $Global:ChangePButton1.location         = New-Object System.Drawing.Point(7,138)
    $Global:ChangePButton1.Font             = New-Object System.Drawing.Font('Microsoft Sans Serif',10)

    $ChangePasswordForm.controls.AddRange(@($ChangePCombo,$ChangePLabel1,$ChangePLabel2,$ChangePLabel3,$ChangePTextBox1,$ChangePTextBox2,$ChangePCheckBox1,$ChangePCheckBox2,$ChangePButton1))
}


######################################################################################################
MainWindow
AddCiscoWindow
AddRDPWindow
AddFortiWindows
ChangeCredsWindow
AddHostWindow

$VPNCLIPath86 = "C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe"
$VPNCLIPath = "C:\Program Files\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe"
$TestPath = Test-Path $VPNCLIPath86 -PathType Leaf
$vpnCheck = Get-WmiObject -Query "Select Name,NetEnabled from Win32_NetworkAdapter where (Name like '%AnyConnect%')"
[System.collections.arraylist]$WindowsVPNs=@()
[System.collections.arraylist]$FortiVPNs=@()
######################################################################################################
$Connect.Add_Click({
    EndTask $true
    CloseConnections
    VPNConnect
    TestConnection 1
    ServerRoles
})

$Disconnect.Add_Click({
    $CLabelStatus.ForeColor   = 'Gray'
    $CLabelStatus.text        = "Disconnecting..."
    CloseConnections
    TestConnection
})

$AddConnection.Add_Click({
    $NewConnectionForm.ShowDialog() | Out-Null
})

$AddRDPC.Add_Click({
    $CreateRDP_Form.ShowDialog() | Out-Null
})

$RDPButton.Add_Click({
    AddRDP
})

$HostButton.Add_Click({
    AddHostFunction
})

$AddHost.Add_Click({
    $CreateHost_Form.ShowDialog() | Out-Null
})

$CB_SMS.Add_CheckedChanged({
    EnableSMS
})

$CB_Group.Add_CheckedChanged({
    EnableGroup
})

$Forti_CB1.Add_CheckedChanged({
    EnablePort
})

$ChangePCheckBox1.Add_CheckedChanged({
    EnableUsername
})

$ChangePCombo.Add_Textchanged({
    CheckPasswordTextChanged
})

$CreateVPN.Add_Click({
    AddVPN
})

$Forti_Button1.Add_Click({
    AddFortiVPN
})

$listview.Add_ItemActivate({
    ConnectRDPListView
})

$Update.Add_Click({
    $AddFortiVPN.ShowDialog() | Out-Null
})

$ChangePass.Add_Click({
    $ChangePasswordForm.ShowDialog() | Out-Null
})

$ChangePButton1.Add_Click({
    ChangeCreds
})

$ListViewHost.Add_ItemActivate({
    ConnectHostListView
})

######################################################################################################
Function TestConnection {
    Param (
        $Timer = 0
    )
    $global:TestConnect = 0
    If($Timer -ne 0){
    $Counter = 0
    }
    Else{
        $Counter = 7
    }
    While ($Counter -lt 8){
        $vpnCheck = Get-WmiObject -Query "Select Name,NetEnabled from Win32_NetworkAdapter where (Name like '%AnyConnect%')"
        $Fortivpncheck = Get-WmiObject -Query "Select Name,NetEnabled from Win32_NetworkAdapter where (Name like '%Fortinet SSL VPN%')"
        $WindowsCheck = rasdial
        If ($WindowsCheck -Match "Connected to"){
            $VPNCheckWindowsFull = $True
        }

        If($vpnCheck.NetEnabled -eq $True -or $VPNCheckWindows -eq $True -or $VPNCheckWindowsFull -eq $True -or $Fortivpncheck.NetEnabled -eq $True){
            $global:TestConnect = 1
            $Counter = 10
        }

        $Counter++
        start-sleep -Seconds 1
    }
    

    If($TestConnect -gt 0){
        $CLabelStatus.ForeColor   = 'Green'
        $CLabelStatus.text        = "Connected"
        $VPNlabel1.Text           = $VPNInput.text
    }
    else{
        $CLabelStatus.ForeColor   = 'Red'
        $CLabelStatus.text        = "Disconnected"
        $ListView.Items.Clear()
        $listviewHost.Items.Clear()
        $VPNlabel1.Text           = ""
    }
}

Function ConnectRDPListView {
    if($listview.SelectedItems.Count -eq 1) {
        $RDPName = $ListView.SelectedItems[0].text
        $RDPFullName = $ListView.SelectedItems[0].text + ".rdp"
        $TxtFullName = $ListView.SelectedItems[0].text + ".txt"
        $TestPath = Test-Path -Path ".\Kunde RDP\$($VPNlabel1.text)\$RDPFullName" -Pathtype Leaf
    if($TestPath -eq $true){
        $RDPLocation = Get-Childitem -Path ".\Kunde RDP\$($VPNlabel1.text)" -Filter *.RDP | Where-Object { $_.BaseName -Match $RDPName} -ErrorAction SilentlyContinue
        Start-Process $RDPLocation.Fullname 
    }
    Else{
        $IPAddress = Get-Content ".\Kunde RDP\$($VPNlabel1.text)\$TxtFullname"

    }
    }
}

Function ConnectHostListView {
    if($ListViewHost.SelectedItems.Count -eq 1) {
        $TxtFullName = $ListViewHost.SelectedItems[0].text + ".txt"
        $IPAddress = Get-Content ".\Kunde RDP\$($VPNlabel1.text)\Hosts\$TxtFullname"
    Try{
        Start-Process Chrome $IPAddress
    }
    Catch{
        Start-Process iexplore $IPAddress
    }
    }
}

Function ServerRoles {
    $ListView.Items.Clear()
    $ListViewHost.Items.Clear()
    If($TestConnect -gt 0){
        $TP = Test-Path -Path ".\Kunde RDP\$($VPNInput.text)\Server Roles"
        $HP = Test-Path -Path ".\Kunde RDP\$($VPNInput.text)\Hosts"
        If($TP -eq $True) {
            $SVRoles = Get-Childitem ".\Kunde RDP\$($VPNInput.text)\Server Roles" -Filter *.txt 
            Foreach($file in $SVRoles){
                $GetC = Get-Content $file.Fullname
                $Item = New-Object System.Windows.Forms.ListViewItem($file.BaseName)
                $Item.SubItems.Add($GetC)
                $listview.Items.Add($Item) | Out-Null
            }
        }
        If($HP -eq $True) {
            $HPs = Get-Childitem ".\Kunde RDP\$($VPNInput.text)\Hosts" -Filter *.txt 
            Foreach($file in $HPs){
                $GetH = Get-Content $file.Fullname
                $ItemH = New-Object System.Windows.Forms.ListViewItem($file.BaseName)
                $ItemH.SubItems.Add($GetH)
                $listviewHost.Items.Add($ItemH) | Out-Null
            }
        }
    }
}

Function AddVPN {
    $TXTname = ".\Kunder\Anyconnect\$($TB_Name.text).txt"
    If($TB_Name.textlength -ne 0 -and $TB_AddVPN.textlength -ne 0 -and $TB_AddUS.textlength -ne 0 -and $TB_AddPW.textlength -ne 0){
        Add-Content $TXTname $TB_Name.text
        Add-Content $TXTname $TB_AddVPN.text
        Add-Content $TXTname $TB_AddUS.text
        $SecurePassword = ConvertTo-SecureString $TB_AddPW.text -AsPlainText -Force | ConvertFrom-SecureString | Add-Content "$TXTname"
        Add-Content $TXTname $TB_AddSMS.text
        Add-Content $TXTname $TB_AddGroup.text
        New-Item -Path ".\Kunde RDP" -Name $TB_Name.text -ItemType "Directory" -ErrorAction SilentlyContinue
        New-Item -Path ".\Kunde RDP\$($TB_Name.text)" -Name "Server Roles" -ItemType "Directory" -ErrorAction SilentlyContinue
        if($CB_TwoF.checked -eq $True){
        Add-Content $TXTname "MFA=Enabled"
        }
        $TB_Name.text = $Null
        $TB_AddVPN.text = $Null
        $TB_AddUS.text = $Null
        $TB_AddPW.text = $Null
        $TB_AddSMS.text = $Null
        $TB_AddGroup.text = $Null
        $CB_TwoF.checked = $False
        $CB_SMS.checked = $False
    }
}

Function AddFortiVPN {
    $TXTname = ".\Kunder\Forticlient\$($Forti_TB1.text).txt"
    If($Forti_Tb1.textlength -ne 0 -and $Forti_TB2.textlength -ne 0 -and $Forti_TB3.textlength -ne 0 -and $Forti_TB4.textlength -ne 0 -and $Forti_TB5.textlength -ne 0){
        Add-content $TXTname $Forti_TB1.text
        Add-content $TXTname $Forti_TB2.text
        Add-content $TXTname $Forti_TB3.text
        Add-content $TXTname $Forti_TB4.text
        $SecurePassword = ConvertTo-SecureString $Forti_TB5.text -AsPlainText -Force | ConvertFrom-SecureString | Add-Content "$TXTname"
        if ($Forti_CB2.Checked){
            Add-content $TXTname "MFA=Enabled"
        }
        New-Item -Path ".\Kunde RDP" -Name $Forti_TB1.text -ItemType "Directory" -ErrorAction SilentlyContinue
        New-Item -Path ".\Kunde RDP\$($Forti_TB1.text)" -Name "Server Roles" -ItemType "Directory" -ErrorAction SilentlyContinue
        $Forti_TB1.text = $Null
        $Forti_TB2.text = $Null
        $Forti_TB3.text = "443"
        $Forti_TB4.text = $Null
        $Forti_TB5.text = $Null
        $Forti_CB1.checked = $false
    }
}

Function EnableSMS {
    if($CB_SMS.Checked){
        $TB_AddSMS.Enabled = $true
    }
    Else {
        $TB_AddSMS.Enabled = $false
    }
}

Function EnableGroup {
    if($CB_Group.Checked){
        $TB_AddGroup.Enabled = $true
    }
    Else {
        $TB_AddGroup.Enabled = $false
    }
}

Function EnablePort {
    if($Forti_CB1.Checked){
        $Forti_TB3.Enabled = $true
    }
    Else {
        $Forti_TB3.Enabled = $false
    }
}

Function EnableUsername {
    If($ChangePCheckBox1.Checked){
        $ChangePTextBox1.Enabled = $True
    }
    Else {
        $ChangePTextBox1.Enabled = $False
    }

}

Function CheckPasswordTextChanged {
    $TestPath = Test-Path ".\Kunder\Anyconnect\$($ChangePCombo.text).txt"
    $TestPathForti = Test-Path ".\Kunder\Forticlient\$($ChangePCombo.text).txt"
    If($TestPath -eq $True){
        $Kunde = Get-Content ".\Kunder\Anyconnect\$($ChangePCombo.text).txt"
        $ChangePTextBox1.text = $Kunde[2]
        if($kunde[6] -ne $Null){
            $ChangePCheckBox2.checked = $true
        }
        else{
            $ChangePCheckBox2.checked = $false
        }
    } 
    If($TestPathForti -eq $True){
        $Kunde = Get-Content ".\Kunder\FortiClient\$($ChangePCombo.text).txt" 
        $ChangePTextBox1.text = $Kunde[3]
        if($kunde[5] -ne $Null){
            $ChangePCheckBox2.checked = $true
        }
        else{
            $ChangePCheckBox2.checked = $false
        }
    }
}

Function ChangeCreds {
    $TestPath = Test-Path -Path ".\Kunder\Anyconnect\$($ChangePCombo.text).txt" -Pathtype Leaf
    $TestPathForti = Test-Path -Path ".\Kunder\Forticlient\$($ChangePCombo.text).txt" -Pathtype Leaf
    if($TestPath -eq $True -and $ChangePTextBox2.Textlength -gt 0){
        $content = Get-Content ".\Kunder\Anyconnect\$($ChangePCombo.text).txt"
        $Path = "Anyconnect"
        $Content[3] = $SecurePassword = ConvertTo-SecureString $ChangePTextBox2.text -AsPlainText -Force | ConvertFrom-SecureString
        if($ChangePCheckBox1.Checked -eq $True){
            $Content[2] = $ChangePTextBox1.Text
        }
        $Content | Set-Content ".\kunder\$Path\$($ChangePCombo.text).txt"
        $ChangePTextBox2.text = $Null
        $ChangePCheckBox1.Checked = $False
    }
    if($TestPathForti -eq $True -and $ChangePTextBox2.textlength -gt 0){
        $content = Get-Content ".\Kunder\Forticlient\$($ChangePCombo.text).txt"
        $Path = "Forticlient"
        $Content[4] = $SecurePassword = ConvertTo-SecureString $ChangePTextBox2.text -AsPlainText -Force | ConvertFrom-SecureString
        if($ChangePCheckBox1.Checked -eq $True){
        $Content[3] = $ChangePTextBox1.Text
        }
        $Content | Set-Content ".\kunder\$Path\$($ChangePCombo.text).txt"
        $ChangePTextBox2.text = $Null
        $ChangePCheckBox1.Checked = $False
    }
}

Function AddCombo {
    $VPNInput.AutoCompleteCustomSource.Clear()
    $VPNList = Get-Childitem ".\Kunder\Anyconnect" -Filter *.txt
    $VPNlistForti = Get-Childitem ".\Kunder\Forticlient" -Filter *.txt
    $GetWindowsVPN = Get-VPNconnection
    $GetWindowsVPNFull = Get-VpnConnection -AllUserConnection
    $Counter = 0
   Foreach($c in $VPNList) {
        $Content = Get-Content $c.Fullname
        $VPNInput.Items.Add($Content[0]) | Out-Null
        $VPNInput.AutoCompleteCustomSource.AddRange($Content[0]) | Out-Null
        $RDP_INPUT_COMBO.Items.Add($Content[0]) | Out-Null
        $RDP_INPUT_COMBO.AutoCompleteCustomSource.AddRange($Content[0]) | Out-Null
        $Host_INPUT_COMBO.Items.Add($Content[0]) | Out-Null
        $Host_INPUT_COMBO.AutoCompleteCustomSource.AddRange($Content[0]) | Out-Null
        $ChangePCombo.Items.Add($Content[0]) | Out-Null
        $ChangePCombo.AutoCompleteCustomSource.AddRange($Content[0]) | Out-Null
        If ($counter -eq 0) {
            $VPNInput.Text = $Content[0]
            $RDP_INPUT_COMBO.Text = $Content[0]
            $Host_INPUT_COMBO.Text = $Content[0]
            $ChangePCombo.Text = $Content[0]
            $counter++
        }
    }

    Foreach ($VPN in $VPNlistForti){
        $Content = Get-Content $VPN.Fullname
        $VPNInput.Items.Add($Content[0]) | Out-Null
        $VPNInput.AutoCompleteCustomSource.AddRange($Content[0]) | Out-Null
        $RDP_INPUT_COMBO.Items.Add($Content[0]) | Out-Null
        $RDP_INPUT_COMBO.AutoCompleteCustomSource.AddRange($Content[0]) | Out-Null
        $ChangePCombo.Items.Add($Content[0]) | Out-Null
        $ChangePCombo.AutoCompleteCustomSource.AddRange($Content[0]) | Out-Null
        $FortiVPNs.add($Content[0]) | Out-Null
    }

    Foreach($VPN in $GetWindowsVPN){
        $VPNInput.Items.Add($VPN.Name) | Out-Null
        $VPNInput.AutoCompleteCustomSource.AddRange($VPN.name) | Out-Null
        $RDP_INPUT_COMBO.Items.Add($VPN.name) | Out-Null
        $RDP_INPUT_COMBO.AutoCompleteCustomSource.AddRange($VPN.name) | Out-Null
        $WindowsVPNs.add($VPN.Name) | Out-Null
    }

    Foreach($VPN in $GetWindowsVPNFull){
        $VPNInput.Items.Add($VPN.Name) | Out-Null
        $VPNInput.AutoCompleteCustomSource.AddRange($VPN.name) | Out-Null
        $RDP_INPUT_COMBO.Items.Add($VPN.name) | Out-Null
        $RDP_INPUT_COMBO.AutoCompleteCustomSource.AddRange($VPN.name) | Out-Null
        $WindowsVPNs.add($VPN.Name) | Out-Null
    }
    
}

Function EndTask {
    Param(
        $Connecting = $False
    )
    if($Connecting -eq $True){
        $CLabelStatus.text        = "Connecting..."
        $CLabelStatus.ForeColor   = "Gray"
        $VPNlabel1.text           = ""
    }
    Get-Process | Foreach-object {if($_.ProcessName.ToLower() -eq "vpnui" -or $_.ProcessName.ToLower() -eq "vpncli") {
    $Id = $_.Id
    Stop-Process $Id
}}}

Function CloseConnections {
    $WindowsVPN = rasdial
    Start-Process -WindowStyle Minimized -FilePath $CLIPath -ArgumentList 'disconnect' -wait #Closes CiscoVPN Connections
    .\Forticlient\FortiSSLVPNclient.exe disconnect | Out-Null
    if ($WindowsVPN -match "Connected to"){
        rasdial /disconnect | Out-Null #Closes WindowsVPN Connections 
    }

}

Function VPNConnect {
    $VPNCounter = 0
    $Kunde = $VPNInput.text

    Foreach($VPN in $WindowsVPNs){
        If($VPN -eq $Kunde){
            $VPNCounter = 1
        }
    }

    Foreach ($VPN in $FortiVPNs){
        if ($VPN -eq $Kunde){
            $VPNCounter = 2
        }
    }

    If($VPNCounter -eq 1){
        rasphone.exe -d $Kunde | Out-Null
    }

    if($VPNCounter -eq 2){
        $GetCreds = Get-Content ".\kunder\Forticlient\$($Kunde).txt"
        $SecurePassword = $GetCreds[4] | ConvertTo-SecureString
        $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
        $UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)

        $Profilename = $GetCreds[1]
        $ComputerName = $GetCreds[1]
        $Port = $GetCreds[2]
        $Username = $GetCreds[3]
        $Password = $UnsecurePassword
        $MFA = $GetCreds[5]


        .\FortiClient\FortiSSLVPNclient.exe connect -s $ProfileName -h "$ComputerName`:$Port" -u "$username`:$password" -q -m -i 
        if ($MFA -ne $Null){
            [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
            $title = 'Test Connection'
            $msg   = 'Click "OK" when MFA code has been entered'
            $oReturn=[System.Windows.Forms.Messagebox]::Show($msg, $title)
        }
    }

    If ($VPNCounter -eq 0) {
        $GetCreds = Get-Content ".\kunder\Anyconnect\$($Kunde).txt"
        $Server = $GetCreds[1]
        $User = $GetCreds[2]
        $SecurePassword = $GetCreds[3] | ConvertTo-SecureString
        $BSTR = [System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($SecurePassword)
        $UnsecurePassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto($BSTR)
        $SMSPasscode = $GetCreds[4]
        $Group = $GetCreds[5]
        $TwoFactor = $GetCreds[6]
        $Certificate = $GetCreds[7]

        Start-Process -WindowStyle Minimized -FilePath $CLIPath -ArgumentList "connect $Server"
        $counter = 0; $h = 0;
        while($counter++ -lt 1000 -and $h -eq 0)
        {
            sleep -m 10
            $h = (Get-Process vpncli).MainWindowHandle
        }
        if($h -eq 0){echo "Could not start VPNUI it takes too long."}
        if($Group.Length -gt 0){
            [System.Windows.Forms.SendKeys]::SendWait("$Group{Enter}")
        }
        if($Certificate.Length -gt 0){
            [System.Windows.Forms.SendKeys]::SendWait("y{Enter}")
        }
        [System.Windows.Forms.SendKeys]::SendWait("$User{Enter}")
        [System.Windows.Forms.SendKeys]::SendWait("$UnsecurePassword{Enter}")
        if($SMSPasscode.length -gt 1){
            [System.Windows.Forms.SendKeys]::SendWait("$SMSPasscode{Enter}")
        }
        if($Certificate.Length -gt 0){
        [System.Windows.Forms.SendKeys]::SendWait("y{Enter}")
        }
        If($TwoFactor -eq "MFA=Enabled"){
            [void][Reflection.Assembly]::LoadWithPartialName('Microsoft.VisualBasic')
            $title = 'MFA'
            $msg   = 'Enter MFA code'
            $TwoFacterCode = [Microsoft.VisualBasic.Interaction]::InputBox($msg, $title)
            $TwoFacterCodeTrim = $TwoFacterCode.trim()
            [System.Windows.Forms.SendKeys]::SendWait("$TwoFacterCodeTrim{Enter}")
        }
    }
}

Function AddRDP {
    if($RDP_RDS_Check.checked -eq $true){
        $IPAddress = $RDP_IP_Input.text+" /admin"
    }
    else {
        $IPAddress = $RDP_IP_Input.text
    }
    $RDPData = "screen mode id:i:2
    use multimon:i:0
    desktopwidth:i:1609
    desktopheight:i:948
    session bpp:i:32
    winposstr:s:0,1,296,29,1609,781
    compression:i:1
    keyboardhook:i:2
    audiocapturemode:i:0
    videoplaybackmode:i:1
    connection type:i:7
    networkautodetect:i:1
    bandwidthautodetect:i:1
    displayconnectionbar:i:1
    enableworkspacereconnect:i:0
    disable wallpaper:i:0
    allow font smoothing:i:0
    allow desktop composition:i:0
    disable full window drag:i:1
    disable menu anims:i:1
    disable themes:i:0
    disable cursor setting:i:0
    bitmapcachepersistenable:i:1
    full address:s:$IPAddress
    audiomode:i:0
    redirectprinters:i:1
    redirectcomports:i:0
    redirectsmartcards:i:1
    redirectclipboard:i:1
    redirectposdevices:i:0
    autoreconnection enabled:i:1
    authentication level:i:0
    prompt for credentials:i:1
    negotiate security layer:i:1
    remoteapplicationmode:i:0
    alternate shell:s:
    shell working directory:s:
    gatewayhostname:s:
    gatewayusagemethod:i:4
    gatewaycredentialssource:i:4
    gatewayprofileusagemethod:i:0
    promptcredentialonce:i:0
    gatewaybrokeringtype:i:0
    use redirection server name:i:0
    rdgiskdcproxy:i:0
    kdcproxyname:s:
    drivestoredirect:s:"
    if($RDP_INPUT_COMBO.textlength -ne 0 -and $RDP_IP_Input.textlength -ne 0 -and $SN_Input.textlength -ne 0){
        New-Item -Path ".\Kunde RDP" -Name $RDP_INPUT_COMBO.text -ItemType "Directory" -ErrorAction SilentlyContinue
        New-Item -Path ".\Kunde RDP\$($RDP_INPUT_COMBO.text)" -Name "Server Roles" -ItemType "Directory" -ErrorAction SilentlyContinue
        Add-Content ".\Kunde RDP\$($RDP_INPUT_COMBO.text)\$($SN_Input.text).rdp" $RDPData
        $FileName = $SN_Input.text + ".txt"
        Add-Content ".\Kunde RDP\$($RDP_INPUT_COMBO.text)\Server Roles\$($SN_Input.text).txt" $RDP_ROLES_INPUT.text
        $RDP_IP_Input.text = $Null
        $SN_Input.text = $Null 
        $RDP_RDS_Check.checked = $False
        $RDP_ROLES_INPUT.text = $Null
        ServerRoles
    }
}

function AddHostFunction {
    if($Host_INPUT_COMBO.textlength -ne 0 -and $Host_IP_Input.textlength -ne 0 -and $Host_SN_Input.textlength -ne 0){
        New-Item -Path ".\Kunde RDP" -Name $Host_INPUT_COMBO.text -ItemType "Directory" -ErrorAction SilentlyContinue
        New-Item -Path ".\Kunde RDP\$($Host_INPUT_COMBO.text)" -Name "Hosts" -ItemType "Directory" -ErrorAction SilentlyContinue
        $FileName = $SN_Input.text + ".txt"
        Add-Content ".\Kunde RDP\$($Host_INPUT_COMBO.text)\Hosts\$($Host_SN_Input.text).txt" $Host_IP_Input.text
        $Host_IP_Input.text = $Null
        $Host_SN_Input.text = $Null 
        ServerRoles
    }
}

function ShowConsole {
    $consolePtr = [Console.Window]::GetConsoleWindow()
    [Console.Window]::ShowWindow($consolePtr, 5) #5 show
}

function HideConsole {
    $consolePtr = [Console.Window]::GetConsoleWindow()
    [Console.Window]::ShowWindow($consolePtr, 0) #0 hide
}

If($TestPath -eq $True) {
    [string]$CLIPath = 'C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe'
    [string]$EXEPath = 'C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe'
}
Else {
    [string]$CLIPath = 'C:\Program Files\Cisco\Cisco AnyConnect Secure Mobility Client\vpncli.exe'
    [string]$EXEPath = 'C:\Program Files\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe'
}

#HideConsole
CloseConnections
AddCombo
TestConnection



$MainForm.ShowDialog() | Out-Null

