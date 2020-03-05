Install-Module -Name WifiTools

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