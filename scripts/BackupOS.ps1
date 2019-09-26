<#
Help
OWNER.

Owner Rafal Bialek
E-mail bialek.rafal87@gmail.com

SYNTAX.
The script has built-in functions
CreateDirectory - Creates a backup folder if the folder already exists, it will be changed to OLD
CreateBuckupFile - Creates a copy of files in locations
$ Env: USERPROFILE
$ Env: LOCALAPPDATA \ Microsoft \ Outlook
$ Env: LOCALAPPDATA \ Google
$ env: LOCALAPPDATA \ Microsoft \ Internet Explorer
OsBuckUp - Creates a Windows backup
TestBackup - Performs a test of paths and folders and files from a copy
GetDateBackup - Checks the backup date
Exitt - Exits and closes PowerShell

COPYRIGHT©

As the creator of the program, I allow copying and using the program. But if you make any changes to the code, please inform me about the changes.

#>



[void][System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")

$Day = Get-Date 

$ComputerName = $env:COMPUTERNAME

$Info=((Get-Item -Path "D:\Backup $ComputerName" -ErrorAction SilentlyContinue).CreationTime) # Will give You day when , You have created file or dir

Function CreateDirectory {

    cls

    $Day = Get-Date

    $ComputerName = $env:COMPUTERNAME

    if((Get-Item -Path "D:\Backup $ComputerBame" -ErrorAction SilentlyContinue).Exists){ # You can use own path with Get-Item -Path "Your path"

    $Message=[System.Windows.Forms.MessageBox]::Show("You have already created backup form day $info!!! do You want create newly backup ???","INFO",3,64)

if($Message -eq "Yes"){

    $ComputerName = $env:COMPUTERNAME

    Rename-Item -Path "D:\Backup $computername" -NewName "Backup $ComputerName OLD!!!" -Force -Confirm:$false -Verbose -ErrorAction SilentlyContinue

    New-Item -Path "D:\" -Name "Backup $computername"  -ItemType Directory  -Force -Verbose

    Get-childItem -Path $env:USERPROFILE | Copy-Item -Destination "D:\Backup $computername\Folders" -Recurse -Verbose

    Get-Item -Path $env:USERPROFILE | Copy-Item -Destination "D:\Backup $computername\Profile" -Recurse -Verbose

    [System.Windows.Forms.MessageBox]::Show("Backup for Your profile and files created in day $info!!!","APPROVED",1,64)

        }

Else{

    [System.Windows.Forms.MessageBox]::Show("You have canceled process","CANCELED",1,16)


        }
    }

Else{

    $ComputerName = $env:COMPUTERNAME

    New-Item -Path "D:\" -Name "Backup $ComputerName" -ItemType Directory -Force -Verbose

    $Info=((Get-Item -Path "D:\Backup $computername").CreationTime)

    New-Item -Path "D:\Backup $computername" -Name backupday.txt -ItemType File -Value $info -Verbose -Force

        }

Backup:Creator

}

Function CreateBuckupFile { 

$ComputerName = $env:COMPUTERNAME

    cls

    Write-Host "##################################  PLEASE WAIT #######################################" 

    Get-childItem -Path $env:USERPROFILE | Copy-Item -Destination "D:\Backup $ComputerName\Folders" -Recurse  

    Get-Item -Path "$env:USERPROFILE" | Copy-Item -Destination "D:\Backup $computername\Profile" -Recurse 

    Get-Item -Path "$env:LOCALAPPDATA\Microsoft\Outlook" |  Copy-Item -Destination "D:\Backup $computername\Outlook" -Recurse 

    Get-Item -Path "$env:LOCALAPPDATA\Google" | Copy-Item -Destination "D:\Backup $computername\Chrome" -Recurse

    Get-Item -Path "$env:LOCALAPPDATA\Microsoft\Internet Explorer" | Copy-Item -Destination "D:\Backup $computername\InternetExplorer" -Recurse

    [System.Windows.Forms.MessageBox]::Show("Backup for Your profile and files created in day $info!!!","APPROVED",1,64)

    Backup:Creator

        }

Function OsBuckUp {

    cls

    $ComputerName = $env:COMPUTERNAME

    $Path= "D:\Backup $computername"

    wbAdmin start backup -backupTarget:D: -include:C: -allCritical -quiet *> "D:\Backup $ComputerName\Backup.log"

    Move-Item -Path "D:\WindowsImageBackup" -Destination "D:\Backup $ComputerName" -Force -Verbose -Confirm:$false


    Backup:Creator

}

Function TestBackup  {

    cls

    $ComputerName = $env:COMPUTERNAME

    $Backup = Test-Path -Path "D:\Backup $computername" -Verbose

    $Folders = Test-Path -Path "D:\Backup $computername\Profile" -Verbose

    $Profile = Test-Path -Path "D:\Backup $computername\Profile" -Verbose

    $Os = Test-Path -Path "D:\Backup $computername\WindowsImageBackup" -Verbose

if($Backupp -eq $True){

    [System.Windows.Forms.MessageBox]::Show("Directory exists")

    }

Else{

    [System.Windows.Forms.MessageBox]::Show("You don't have directory")

    }
if($Folders -eq $True){

    [System.Windows.Forms.MessageBox]::Show("Backup for Folders created")

    }

Else{

    [System.Windows.Forms.MessageBox]::Show("Backup for Your folders is False")

    }

if($Profile -eq $True){

    [System.Windows.Forms.MessageBox]::Show("Backup for profiles created")

    }

Else{

    [System.Windows.Forms.MessageBox]::Show("Backup for Your profile is False")

    } 

if($Os -eq $True){

    [System.Windows.Forms.MessageBox]::Show("Backup for C drive created")

    }

Else{

    [System.Windows.Forms.MessageBox]::Show("Backup for Your C drive is False")

    }      
        Backup:Creator

        }

Function GetDateBackup  {

    cls

    $ComputerName=$env:COMPUTERNAME

    $Info=((Get-Item -Path "D:\Backup $ComputerName").CreationTime)

    [System.Windows.Forms.MessageBox]::Show("Backup for Your created in day $info!!!","CREATED",1,64)

        
        Backup:Creator
        
        }
        
Function Exitt {

    Get-Process -Name *PowerShell* | Stop-Process -Force

    Backup:Creator

        }



Function Backup:Creator {

#MENU

Do {
 
        Write-Host "##################################  MENU #######################################" 
        Write-Host "****************PLEASE SELECT BETWEEN 1  AND 5  TO MANAGE BACKUP****************"                             
        Write-Host ""
        Write-Host "1 =Creating folder for Your backup file "  "" -ForegroundColor White -BackgroundColor Red
        Write-Host "2 =Creating backup for files"  "" -ForegroundColor White -BackgroundColor Red
        Write-Host "3 =Creating OS backup"  "" -ForegroundColor White -BackgroundColor Red
        Write-Host "4 =Test backup"  "" -ForegroundColor White -BackgroundColor Red
        Write-Host "5 =show creation day"  "" -ForegroundColor White -BackgroundColor Red
        Write-Host "6 = EXIT" -ForegroundColor White -BackgroundColor Red




$select = read-host -prompt "Select number & press enter"; } until ($select -eq "1" -or $select -eq "2" -or $select -eq "3" -or $select -eq "4" -or $select -eq "5" -or $select -eq "6")

Switch ($select) { 

"1" {CreateDirectory   Backup:Creator } }Switch ($select) {"2" {CreateBuckupFile Backup:Creator}"3" {OsBuckUp Backup:Creator}"4"{TestBackup Backup:Creator}"5"{GetDateBackup Backup:Creator}"6"{Exitt Backup:Creator}

        }

    }

Backup:Creator