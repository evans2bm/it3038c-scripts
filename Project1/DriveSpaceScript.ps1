# This powershell script creates a report including the computer name, main drive, amount of drive space used, free and total and the sends that as an email to the user

# This fucntion displays the amount of drive space being used in GB
function getUSED{
    ((Get-PSDrive).used[0]/1GB).ToString("#.#")
}
# This function displays the amount of drive space that is free in GB
function getFREE{
    ((Get-PSDrive).free[0]/1GB).ToString("#.#")
}
# This function displays the total amount of drive space
function getTOTAL{
    ((Get-PSDrive).used[0]/1GB + (Get-PSDrive).free[0]/1GB).ToString("#.#")
}
# This function gets the name of the main drive (C in this case)
function getDRIVE{
   ((Get-PSDrive C).Name)
}
# Creating variables that can call the functions
$USED = getUSED
$FREE = getFREE
$TOTAL = getTOTAL
$CN =$env:computername
$DRIVE = getDrive

# This is the body of the email
$Body = "
Computer Name: $CN
Main Drive: $DRIVE
Drive Space free: $FREE GB free of $TOTAL GB
Drive Space used: $USED GB used of $TOTAL GB"

# This is the email address to send to, the subject, and all other important info
#IMPORTANT: the "To" email address must be changed to the address that the user desires before running the script
Send-MailMessage -To "evans2bm@mail.uc.edu" -From "DriveReport@gmail.com" -Subject "$CN Drive Report" -Body $Body -SmtpServer smtp.gmail.com -Port 587 -UseSsl -Credential (Get-Credential)

# This writes a message that tells us the message was sent
Write-Host("Success! Report Sent")
