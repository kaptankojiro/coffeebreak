#Requires -RunAsAdministrator
#http://woshub.com/popup-notification-powershell/

Set-ExecutionPolicy bypass
Add-Type -AssemblyName System.Windows.Forms
$global:balmsg = New-Object System.Windows.Forms.NotifyIcon
$path = (Get-Process -id $pid).Path
$balmsg.Icon = [System.Drawing.Icon]::ExtractAssociatedIcon($path)
$balmsg.BalloonTipIcon = [System.Windows.Forms.ToolTipIcon]::Warning
$balmsg.BalloonTipText = "It's time for a coffee break!!!"
$balmsg.BalloonTipTitle = "Dear $Env:USERNAME"
$balmsg.Visible = $true
$balmsg.ShowBalloonTip(30000)

[console]::beep(500,500)
[console]::beep(500,500)
[console]::beep(500,500)
[console]::beep(500,500)




