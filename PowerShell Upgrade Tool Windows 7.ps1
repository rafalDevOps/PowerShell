[void][System.Reflection.Assembly]::LoadWithPartialName("system.windows.forms")

$Upgrade = New-Object System.Windows.Forms.Form
$Upgrade.Text = "UPGRADE TOOL FOR POWERSHELL"
$Upgrade.Size = New-Object System.Drawing.Size (800,600) 
$Upgrade.FormBorderStyle = "FixedDialog"
$Upgrade.TopMost = $true
$Upgrade.MaximizeBox =$true
$Upgrade.MinimizeBox =$true
$Upgrade.ControlBox =$true
$Upgrade.BackColor = "silver"
$Upgrade.StartPosition = "CenterScreen"
$Font = New-Object System.Drawing.Font("Times New Roman",16,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$Upgrade.Font = $Font


$Box = New-Object System.Windows.Forms.TextBox 
$Box.Location = New-Object System.Drawing.Size(350,120)
$Box.Size = New-Object System.Drawing.Size(400,350)
$Box.MultiLine = $True
$Box.Text = "Help

BUTTON DOWNLOAD UPDATES DOWNLOADS FILES
KB3191566
KB3191565

BUTTON DOWNLOAD FRAMEWORK DOWNLOADS FILE
KB2901907

BUTTON EXTRACT FILES EXTRACT
KB3191566-x86.zip

BUTTON INSTALL FRAMEWORK
INSTALL NET.FRAMEWORK

BUTTON INSTALL POWERSHELL
INSTALL POWERSHELL 5.1

BUTTON VERSION POWERSHELL
CHECK THE INSTALLED VERSION

"
$Box.ScrollBars = "Vertical"
$Font = New-Object System.Drawing.Font("Times New Roman",10,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$Box.Font = $Font
$Upgrade.Controls.Add($Box)


$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Size (1,1)
$label.Size = New-Object System.Drawing.Size (800,100)
$label.Text = "UPGRADE TOOL FOR POWERSHELL"
$label.ForeColor = "lightyellow"
$label.BackColor = "bLUE"
$Font = New-Object System.Drawing.Font("Times New Roman",24,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$label.Font = $Font
$Upgrade.Controls.Add($label)


$label = New-Object System.Windows.Forms.Label
$label.Location = New-Object System.Drawing.Size (1,100)
$label.Size = New-Object System.Drawing.Size (200,600)
$label.BackColor = "Blue"
$label.Text = "
OPTIONS TO CHOOSE

YOU HAVE TO CHOOSE 
A FEW OPTIONS

"
$label.ForeColor = "lightyellow"
$Font = New-Object System.Drawing.Font("Times New Roman",12,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$label.Font = $Font
$Upgrade.Controls.Add($label)


$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Size (1,120)
$button.Size = New-Object System.Drawing.Size (200,30)
$Font = New-Object System.Drawing.Font("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "DOWNLOAD UPDATES"
$button.Visible = $true
$button.BackColor = "white"
$button.ForeColor = "black"
$Upgrade.Controls.Add($Button)
$label.Controls.Add($button)
$button.Add_click({
Get-Process -Name *Trace32.exe* | Stop-Process -ErrorAction SilentlyContinue
Start-Process -FilePath C:\Windows\System32\taskmgr.exe
New-Item -Path "C:\Temp\Update" -ItemType Directory
New-Item -Path "C:\Temp\Updatex86" -ItemType Directory
$Path = "C:\Temp\Update"
$Path3 = "C:\Temp\Updatex86"
$Powershell = "https://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/W2K12-KB3191565-x64.msu"
$Powershell3 = "https://download.microsoft.com/download/6/F/5/6F5FF66C-6775-42B0-86C4-47D41F2DA187/Win7-KB3191566-x86.zip"
$File3 = "$Path3\Win7-KB3191566-x86.zip"
$File = "$Path\W2K12-KB3191565-x64.msu"
$Download = New-Object System.Net.WebClient
$Download.DownloadFile($Powershell,$File)
$Download = New-Object System.Net.WebClient
$Download.DownloadFile($Powershell3,$File3)
})

$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Size (1,150)
$button.Size = New-Object System.Drawing.Size (200,30)
$Font = New-Object System.Drawing.Font("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "DOWNLOAD FRAMEWORK"
$button.Visible = $true
$button.BackColor = "white"
$button.ForeColor = "black"
$Upgrade.Controls.Add($Button)
$label.Controls.Add($button)
$button.Add_click({
Get-Process -Name *Trace32.exe* | Stop-Process -ErrorAction SilentlyContinue
Start-Process -FilePath C:\Windows\System32\taskmgr.exe
New-Item -Path "C:\Temp\Net.Framework4.5" -ItemType Directory
$Path2 = "C:\Temp\Net.Framework4.5"
$Powershell2 = "https://download.microsoft.com/download/E/2/1/E21644B5-2DF2-47C2-91BD-63C560427900/NDP452-KB2901907-x86-x64-AllOS-ENU.exe"
$File2 = "$Path2\NDP452-KB2901907-x86-x64-AllOS-ENU.exe"
$Download = New-Object System.Net.WebClient
$Download.DownloadFile($Powershell2,$File2)
})


$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Size (1,180)
$button.Size = New-Object System.Drawing.Size (200,30)
$Font = New-Object System.Drawing.Font("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "EXTRACT FILES"
$button.Visible = $true
$button.BackColor = "white"
$button.ForeColor = "black"
$Upgrade.Controls.Add($Button)
$label.Controls.Add($button)
$button.Add_click({
Get-Process -Name *Trace32.exe* | Stop-Process -ErrorAction SilentlyContinue
Start-Process -FilePath C:\Windows\System32\taskmgr.exe
$shell_app=new-object -com shell.application 
$update =  "Win7-KB3191566-x86.zip" 
$zip_file = $shell_app.namespace("C:\Temp\Updatex86"  + "\$update") 
$destination  = $shell_app.namespace("C:\Temp\Updatex86") 
$destination.Copyhere($zip_file.items())
})


$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Size (1,210)
$button.Size = New-Object System.Drawing.Size (200,30)
$Font = New-Object System.Drawing.Font("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "INSTALL FRAMEWORK"
$button.Visible = $true
$button.BackColor = "white"
$button.ForeColor = "black"
$Upgrade.Controls.Add($Button)
$label.Controls.Add($button)
$button.Add_click({
Get-Process -Name *Trace32.exe* | Stop-Process -ErrorAction SilentlyContinue
Start-Process -FilePath C:\Windows\System32\taskmgr.exe
Set-Location C:\Temp\Net.Framework4.5
.\NDP452-KB2901907-x86-x64-AllOS-ENU /s /q
})



$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Size (1,240)
$button.Size = New-Object System.Drawing.Size (200,30)
$Font = New-Object System.Drawing.Font("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "INSTALL POWERSHELL"
$button.Visible = $true
$button.BackColor = "white"
$button.ForeColor = "black"
$Upgrade.Controls.Add($Button)
$label.Controls.Add($button)
$button.Add_click({
Get-Process -Name *Trace32.exe* | Stop-Process -ErrorAction SilentlyContinue
Start-Process -FilePath C:\Windows\System32\taskmgr.exe
Set-Location C:\Temp\Update
wusa.exe W2K12-KB3191565-x64.msu /quiet /norestart
Start-Sleep -Seconds 360
Set-Location C:\Temp\Updatex86
wusa.exe Win7-KB3191566-x86.msu /quiet /norestart
})



$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Size (1,270)
$button.Size = New-Object System.Drawing.Size (200,30)
$Font = New-Object System.Drawing.Font("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "VERSION POWERSHELL"
$button.Visible = $true
$button.BackColor = "white"
$button.ForeColor = "black"
$Upgrade.Controls.Add($Button)
$label.Controls.Add($button)
$button.Add_click({
Get-Process -Name *Trace32.exe* | Stop-Process -ErrorAction SilentlyContinue
Start-Process -FilePath C:\Windows\System32\taskmgr.exe
$PSVersionTable |Out-GridView 
})












$button = New-Object System.Windows.Forms.Button
$button.Location = New-Object System.Drawing.Size (620,500)
$button.Size = New-Object System.Drawing.Size (120,30)
$Font = New-Object System.Drawing.Font("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "EXIT"
$button.BackColor = "white"
$Upgrade.Controls.Add($Button)
$button.Add_click({

Get-Process -name *Powershell* | Stop-Process -ErrorAction SilentlyContinue
})






$Upgrade.Add_Shown({$Upgrade.Activate()})
$Upgrade.ShowDialog() 