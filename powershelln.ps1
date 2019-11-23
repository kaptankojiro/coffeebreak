#Requires -RunAsAdministrator

Set-ExecutionPolicy bypass
Write-Host "This simple applications show it's coffee break time! notification every hour."
sleep 2
Write-Host "It runs as a Windows scheduled task and you can delete it whenever you want."
sleep 2

Write-Host "Testing soundspeaker"
sleep 2
Add-Type -AssemblyName System.Windows.Forms
$global:balmsg = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $pid).Path
$balmsg.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
$balmsg.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
$balmsg.BalloonTipText = "It's time for a coffee break!!!"
$balmsg.BalloonTipTitle = "Dear $Env:USERNAME"
$balmsg.Visible = $true
$balmsg.ShowBalloonTip(20000)

[console]::beep(500,500)
[console]::beep(500,500)
[console]::beep(500,500)
[console]::beep(500,350)
[console]::beep(500,150)



