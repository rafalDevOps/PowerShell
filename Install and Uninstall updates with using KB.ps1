[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")



#Form

$up = New-Object System.Windows.Forms.Form
$up.Size = New-Object System.Drawing.Size (600,500)
$up.StartPosition = "CenterScreen"
$up.ControlBox = $true
$up.MaximizeBox = $true
$up.MinimizeBox = $true
$up.TopMost = $false
$up.FormBorderStyle = "FixedDialog"
$up.ForeColor = "Black"
$up.BackColor = "Silver"
$up.Text = "KB Manager"
$up.Font = New-Object System.Drawing.Font ("Time New Roman",10,[System.Drawing.FontStyle]::Bold)


#Lable 1

$title = New-Object System.Windows.Forms.Label
$title.Size = New-Object System.Drawing.Size (600,100)
$title.Location = New-Object System.Drawing.Size (1,1)
$title.Text = "Install and uninstall updates with using KB article"
$title.ForeColor = "Black"
$title.BackColor = "LightBlue"
$title.Font = New-Object System.Drawing.Font ("Time New Roman",15,[System.Drawing.FontStyle]::Italic)
$up.Controls.Add($title)


#Lable 2

$leftpanel = New-Object System.Windows.Forms.Label
$leftpanel.Size = New-Object System.Drawing.Size (150,400)
$leftpanel.Location = New-Object System.Drawing.Size(1,100)
$leftpanel.Text = "
Functions
"
$leftpanel.ForeColor = "Black"
$leftpanel.BackColor = "LightBlue"
$up.Controls.Add($leftpanel)


#Lable 3

$panel = New-Object System.Windows.Forms.Label
$panel.Size = New-Object System.Drawing.Size (100,40)
$panel.Location = New-Object System.Drawing.Size(350,160)
$panel.Text = "ENTER KB NUMBER"
$panel.ForeColor = "Black"
$panel.BackColor = "Red"
$up.Controls.Add($panel)




#Text 1

$box = New-Object System.Windows.Forms.TextBox
$box.Size = New-Object System.Drawing.Size (200,50)
$box.Location = New-Object System.Drawing.Size (350,200)
$box.Text = ""
$up.Controls.Add($box)



#Install button

$install = New-Object System.Windows.Forms.Button
$install.Size = New-Object System.Drawing.Size (150,30)
$install.Location = New-Object System.Drawing.Size (1,70)
$install.Text = "INSTALL"
$install.ForeColor = "Black"
$install.BackColor = "Silver"
$leftpanel.Controls.Add($install)
$install.Add_click({
$KB = $box.Text 
Install-WindowsUpdate  -KBArticleID "$KB" -AcceptAll 
})


#Uninstall button


$Uninstall = New-Object System.Windows.Forms.Button
$Uninstall.Size = New-Object System.Drawing.Size (150,30)
$Uninstall.Location = New-Object System.Drawing.Size (1,100)
$Uninstall.Text = "UNINSTALL"
$Uninstall.ForeColor = "Black"
$Uninstall.BackColor = "Silver"
$leftpanel.Controls.Add($Uninstall)
$Uninstall.Add_click({
$KB = $box.Text
Uninstall-WindowsUpdate -KBArticleID "$KB"  -Verbose -Confirm:$false  
})

#Fixit button

$Fixit = New-Object System.Windows.Forms.Button
$Fixit.Size = New-Object System.Drawing.Size (150,30)
$Fixit.Location = New-Object System.Drawing.Size (1,130)
$Fixit.Text = "FIXIT TOOL"
$Fixit.ForeColor = "Black"
$Fixit.BackColor = "Silver"
$leftpanel.Controls.Add($Fixit)
$Fixit.Add_click({
$Path = "C:\Temp"
$Updatetool = "https://download.microsoft.com/download/F/E/7/FE74974A-9029-41A0-9EB2-9CCE3FC20B99/wu10.diagcab"
$File = "$Path\wu10.diagcab"
$Download = New-Object System.Net.WebClient
$Download.DownloadFile($Updatetool,$File)
Start-Process -FilePath C:\Temp\wu10.diagcab
})







#Dialog
$up.Add_Shown{($up.Activate())}
$up.ShowDialog()