Install-Module -Name WifiTools

Function WifiState {
    $State = Show-WifiState
    return $State