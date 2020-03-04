Install-Module -Name WifiTools

Function IPConfig {
    $IPConfig= Show-IPConfig
    return $IPConfig
    }

Function PublicIP {
    $PublicIP = Get-PublicIP
    return $PublicIP
    }

Function InterfaceIP {
    $InterfaceIP = Get-InterfaceIP
    return $InterfaceIP
    }

