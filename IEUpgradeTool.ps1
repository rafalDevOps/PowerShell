[void][System.Reflection.Assembly]::LoadWithPartialName("system.windows.forms")

$Upgrade = [System.Windows.Forms.Form]::New()
$Upgrade.Text = "UPGRADE TOOL FOR INTERNET EXPLORER"
$Upgrade.Size = [System.Drawing.Size]::New(840,600) 
$Upgrade.FormBorderStyle = "FixedDialog"
$Upgrade.TopMost = $true
$Upgrade.MaximizeBox =$true
$Upgrade.MinimizeBox =$true
$Upgrade.ControlBox =$true
$Upgrade.BackColor = "white"
$Upgrade.StartPosition = "CenterScreen"
$Font = [System.Drawing.Font]::new("Times New Roman",16,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$Upgrade.Font = $Font
# None, Tile, Center, Stretch, Zoom

$label = [System.Windows.Forms.Label]::new()
$label.Location = [System.Drawing.Size]::new(1,1)
$label.Size = [System.Drawing.Size]::new(840,100)
$label.Text = "UPGRADE TOOL FOR INTERNET EXPLORER"
$label.ForeColor = "black"
$label.BackColor = "silver"
$Font = [System.Drawing.Font]::new("Times New Roman",24,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$label.Font = $Font
$Upgrade.Controls.Add($label)

$Box = [System.Windows.Forms.TextBox]::New() 
$Box.Location = [System.Drawing.Size]::New(1,120)
$Box.Size = [System.Drawing.Size]::New(200,350)
$Box.MultiLine = $True
$Box.Text = "Help

1. Step 
Button WINDOWS VERSION
To check os architecture

2. Step 
Button IE VERSION
To check installed IE

3. Step
Button DOWNLOAD 
32 or 64 bit related to OS architecture

4. Step
Button INSTALL 
32 or 64 bit related to OS architecture
"
$Box.ScrollBars = "Vertical"
$Font = [System.Drawing.Font]::new("Times New Roman",10,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$Box.Font = $Font
$Upgrade.Controls.Add($Box)


$button = [System.Windows.Forms.Button]::New()
$button.Location = [System.Drawing.Size]::New(1,70)
$button.Size =[System.Drawing.Size]::New(140,30)
$Font = [System.Drawing.Font]::new("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "DOWNLOAD IE1132bit"
$button.Visible = $true
$button.BackColor = "silver"
$button.ForeColor = "black"
$Upgrade.Controls.Add($Button)
$label.Controls.Add($button)
$button.Add_click({

    Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Internet Explorer' -name  Version

    Get-Process -Name *Trace32.exe* | Stop-Process -ErrorAction SilentlyContinue

    Start-Process -FilePath C:\Windows\System32\taskmgr.exe

    Remove-Item C:\Temp\Explorer -Recurse -Force  -ErrorAction SilentlyContinue

    New-Item -Path "C:\Temp\Explorer" -ItemType Directory

    $Path1 = "C:\Temp\Explorer"

    $Powershell1 = "http://download.microsoft.com/download/3/B/9/3B99705D-F1A0-47F5-BC64-6939B7128F6A/IE11-Windows6.1-x86-pl-pl.exe" 

    $File1 = "$Path1\IE1132bit.exe"

    $Download = New-Object System.Net.WebClient -Verbose

    $Download.DownloadFile($Powershell1,$File1)
 
})

$button = [System.Windows.Forms.Button]::New()
$button.Location = [System.Drawing.Size]::New(141,70)
$button.Size = [System.Drawing.Size]::New(140,30)
$Font = [System.Drawing.Font]::new("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "DOWNLOAD IE1164bit"
$button.Visible = $true
$button.BackColor = "silver"
$button.ForeColor = "black"
$Upgrade.Controls.Add($Button)
$label.Controls.Add($button)
$button.Add_click({

    Get-Process -Name *Trace32.exe* | Stop-Process -ErrorAction SilentlyContinue

    Start-Process -FilePath C:\Windows\System32\taskmgr.exe

    Remove-Item C:\Temp\Explorer64 -Recurse -Force -ErrorAction SilentlyContinue

    New-Item -Path "C:\Temp\Explorer64" -ItemType Directory

    $Path2 = "C:\Temp\Explorer64"

    $Powershell2 = "http://download.microsoft.com/download/E/F/B/EFBF6FDC-AE5D-404D-B5A3-A695CA831072/IE11-Windows6.1-x64-pl-pl.exe" 

    $File2 = "$Path2\IE1164bit.exe"

    $Download = New-Object System.Net.WebClient -Verbose

    $Download.DownloadFile($Powershell2,$File2) 

})


$button = [System.Windows.Forms.Button]::New()
$button.Location = [System.Drawing.Size]::New(281,70)
$button.Size = [System.Drawing.Size]::New(140,30)
$Font = [System.Drawing.Font]::new("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "WINDOWS VERSION"
$button.Visible = $true
$button.BackColor = "silver"
$button.ForeColor = "black"
$Upgrade.Controls.Add($Button)
$label.Controls.Add($button)
$button.Add_click({

    [System.Windows.Forms.MessageBox]::Show((Get-WmiObject win32_operatingsystem).osarchitecture,"OS Version",1)

})


$button = [System.Windows.Forms.Button]::New()
$button.Location = [System.Drawing.Size]::New(421,70)
$button.Size = [System.Drawing.Size]::New(140,30)
$Font = [System.Drawing.Font]::new("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "IE VERSION"
$button.Visible = $true
$button.BackColor = "silver"
$button.ForeColor = "black"
$Upgrade.Controls.Add($Button)
$label.Controls.Add($button)
$button.Add_click({

[System.Windows.Forms.MessageBox]::Show((Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Internet Explorer').Version)

})

$button = [System.Windows.Forms.Button]::New()
$button.Location = [System.Drawing.Size]::New(561,70)
$button.Size = [System.Drawing.Size]::New(140,30)
$Font = [System.Drawing.Font]::new("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "INSTALL IE32bit"
$button.Visible = $true
$button.BackColor = "silver"
$button.ForeColor = "black"
$Upgrade.Controls.Add($Button)
$label.Controls.Add($button)
$button.Add_click({

    Get-Process -Name *Trace32.exe* | Stop-Process -ErrorAction SilentlyContinue

        Start-Process -FilePath C:\Windows\System32\taskmgr.exe

            Start-Process -FilePath C:\Windows\System32\cmd.exe -NoNewWindow

                cd C:\Temp\Explorer

    .\IE1132bit.exe /quiet /norestart

    })

$button = [System.Windows.Forms.Button]::New()
$button.Location = [System.Drawing.Size]::New(701,70)
$button.Size = [System.Drawing.Size]::New(140,30)
$Font = [System.Drawing.Font]::new("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "INSTALL IE64bit"
$button.Visible = $true
$button.BackColor = "silver"
$button.ForeColor = "black"
$Upgrade.Controls.Add($Button)
$label.Controls.Add($button)
$button.Add_click({

    Get-Process -Name *Trace32.exe* | Stop-Process -ErrorAction SilentlyContinue

    Start-Process -FilePath C:\Windows\System32\taskmgr.exe

    Start-Process -FilePath C:\Windows\System32\cmd.exe -NoNewWindow

    cd C:\Temp\Explorer64

    .\IE1164bit.exe /quiet /norestart

})

$button = [System.Windows.Forms.Button]::New()
$button.Location = [System.Drawing.Size]::New(700,500)
$button.Size = [System.Drawing.Size]::New(120,30)
$Font = [System.Drawing.Font]::new("Times New Roman",9,[System.Drawing.FontStyle]::Italic)
# Font styles are: Regular, Bold, Italic, Underline, Strikeout
$button.Font = $Font  
$button.Text = "EXIT"
$button.ForeColor = "black"
$button.BackColor = "silver"
$Upgrade.Controls.Add($Button)
$button.Add_click({

      Get-Process -name *Powershell* | Stop-Process -ErrorAction SilentlyContinue
})



$Upgrade.Add_Shown({$Upgrade.Activate()})
$Upgrade.ShowDialog()