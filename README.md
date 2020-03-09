# README For my IT3038C-Scripts Repository

### DriveSpaceScript (Project1)


This Script can be used to find out information about disk space for the local machine it is used on.

When ran on local machine, it will pull the following system information: Machine Name, Main Disk Name, Disk Space Used, Disk Space Free and Total Disk Space.

The System info is then sent as a email message to the desired recipient's email address.

Note: In line 35 of the script, you must input the "To" email address. This is the email the info will be sent to.

Before sending the email, the system will prompt you for credentials. These will be the credentials for your gmail account.

Upon Success, the script will display a success message.

### DriveSpaceScript2 (Project 2)

This Script is an addition to DriveSpaceScript. When is is ran by the user, it still pulls the same info before as follows: Machine Name, Main Disk Name, Disk Space Used, Disk Space Free and Total Disk Space. 

In addition to that information, the script will also pull the 5 largest files on the specified drive. It will pull information on those files as follows: Name, Directory Path, Size (MB) and Size (GB). These files will then be displayed as list and added to the report. 

In addition to the added info, the script is made easier to run by adding info to the Get-Credentials section on line 43:
    Send-MailMessage -To "bengevans97@gmail.com" -From "DriveReport@gmail.com" -Subject "$CN Drive Report" -Body $Body -SmtpServer           smtp.gmail.com -Port 587 -UseSsl -Credential (Get-Credential -UserName 'bengevans97@gmail.com' -Message 'Please enter your Email         Credentials')
The UserName was added so that the user can run the script more than once and not have to keep putting in their username. The password must still be specified each time.

The username will be that of your gmail account for the email server. The email address in the "To" field can be specified to whatever email you want the info sent to, as long as that email allows emails from unsecure apps.

That report will again be sent to the user as an email

### Lab 7


This will show you how to run the WifiToolsScript, which uses the WifiTools Module.

First, the WifiTools Module will be installed:

    Install-Module -Name WifiTools

Now that the module has been installed, we can use the functions that come with it. In this case, we are using GetiPublicIP, Get-InterfaceIP, and WifiState, but there are many others.

    Function PublicIP {
    $IP = Get-PublicIP
    Write-Host("The Public IP Address is: $IP")
    }
    
    Function InteraceIP {
    $IP= Get-InterfaceIP
    return $IP
    }

    Function WifiState {
    $Wifi= Get-WifiState
    return $Wifi
    }
    
Now we just have to import the module:

    Import-Module C:\It3038C-Scripts\PowerShell\WifiToolsScript.psm1
    
Finally, we can call the functions from a PowerShell window:

    PublicIP

(Will return the Public IP Address)

    InterfaceIP
    
(Will return the IP Address of the specified interface, like Ethernet0)

    WifiState
    
(Will return state information of the Wi-Fi, if there is Wi-Fi)
