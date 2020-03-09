# This powershell script creates a report including the computer name, main drive, amount of drive space used, free and total, as well as some of the largest files on the drive and the sends that as an email to the user.

# This fucntion displays the amount of drive space being used in GB..
function getUSED{
    ((Get-PSDrive).used[0]/1GB).ToString("#.#")
}
# This function displays the amount of drive space that is free in GB
function getFREE{
    ((Get-PSDrive).free[0]/1GB).ToString("#.#")
}
# This function displays the total amount of drive space.
function getTOTAL{
    ((Get-PSDrive).used[0]/1GB + (Get-PSDrive).free[0]/1GB).ToString("#.#")
}
# This function gets the name of the main drive (C in this case).
function getDRIVE{
   ((Get-PSDrive C).Name)
}
# This function gets the name, directory path, size in GB and MB of the 5 largest files on the specified drive and displays them as a readable list.
function getFiles{
    Get-ChildItem c:\ -r |sort -descending -property length | select -first 5 name, DirectoryName, @{Name="Size (GB)";Expression={[Math]::round($_.length / 1GB, 1)}}, @{Name="Size (MB)";Expression={[Math]::round($_.length / 1MB, 1)}} | FL | Out-String 
}
# Creating variables that can call the functions.
$USED = getUSED
$FREE = getFREE
$TOTAL = getTOTAL
$CN =$env:computername
$DRIVE = getDrive
$PWD = getFiles


# This is the body of the email.
$Body = "
Computer Name: $CN
Drive Letter of Main Drive: $DRIVE
Drive Space free: $FREE GB free of $TOTAL GB
Drive Space used: $USED GB used of $TOTAL GB
Largest Files on the $DRIVE Drive: $PWD "

# This is the email address to send to, the subject, and all other important info.
# IMPORTANT: the "To" email address must be changed to the address that the user desires before running the script. Additionally, the UserName specified in Get-Credential must be that of the specified email server. This is optional, 
# but it allows the user to run the script without having to put in the user name each time. The Message is what the user will see when asked for credentials.
Send-MailMessage -To "bengevans97@gmail.com" -From "DriveReport@gmail.com" -Subject "$CN Drive Report" -Body $Body -SmtpServer smtp.gmail.com -Port 587 -UseSsl -Credential (Get-Credential -UserName 'bengevans97@gmail.com' -Message 'Please enter your Email Credentials')

# This writes a message that tells us the message was sent
Write-Host("Success! Report Sent")
