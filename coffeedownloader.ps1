#Requires -RunAsAdministrator

Set-ExecutionPolicy bypass
Write-Host "This simple script shows --> it is coffee break time! <-- notification every hour."
sleep 2
Write-Host "It runs as a Windows scheduled task and you can delete it whenever you want scheduled task as administrator."
sleep 2



Write-Host "Creating a new folder if it is necessary..." -ForegroundColor red -BackgroundColor white

$path = "C:\coffee"
If(!(test-path $path))
{
      New-Item -ItemType Directory -Force -Path $path
}


Write-Host "Clearing the folder if it is not empty..." -ForegroundColor red -BackgroundColor white
Remove-Item –path C:\coffee* -Filter *test* -whatif

$HTTP_Request = [System.Net.WebRequest]::Create('https://raw.githubusercontent.com/kaptankojiro/coffeebreak/master/powershelln.ps1')
$HTTP_Response = $HTTP_Request.GetResponse()
$HTTP_Status = [int]$HTTP_Response.StatusCode

If ($HTTP_Status -eq 200) {
   Write-Host "Downloading..." -ForegroundColor red -BackgroundColor white
        $WebClient = New-Object System.Net.WebClient
        $WebClient.DownloadFile("https://raw.githubusercontent.com/kaptankojiro/coffeebreak/master/powershelln.ps1","C:\coffee\powershelln.ps1")
}
Else {
    Write-Host "The Site may be down, please check!"  -ErrorAction Stop  -ForegroundColor red -BackgroundColor white
   exit
}
$HTTP_Response.Close()
 
sleep 2

cmd /c SCHTASKS /Create /SC MINUTE /MO 60 /TN PowershellCoffeeTime /TR "C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe -WindowStyle Hidden -ExecutionPolicy Unrestricted -File C:\coffee\powershelln.ps1"
Start-ScheduledTask -TaskName "PowershellCoffeeTime"


 