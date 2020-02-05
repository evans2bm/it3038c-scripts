#This is a script to send an email with info about our server

#a function that returns an IP address starting with 192
function getIP {
    (Get-NetIPAddress).IPAddress | Select-string "192*"
}
function getDate {
    Get-Date -Format "dddd MM/dd/yyyy HH:mm K"
} 
$env:USERNAME
$PSVersionTable.PSVersion

#set the IP variable
$IP=getIP
$date=getDate
$USER=$env:USERNAME
$env:COMPUTERNAME
$PSversion=$PSVersionTable.PSVersion
#set the body variable
$Body = "This machine's IP is $IP. The user is $USER. The Hostname is $env:COMPUTERNAME. The PowerShell Version is $PSversion. Today's date is $date"

#build and send the email
send-MailMessage -To "bengevans97@gmail.com" -From "me@mail.com" -Subject "IT3038c Windows SysInfo" -Body $Body -SmtpServer smtp.gmail.com -Port 587 -UseSsl -Credential (Get-Credential)

#confirm we reached the end
Write-Host("Email sent")