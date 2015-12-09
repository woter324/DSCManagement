function New-PullServerGuid 
{
    #Generates new GUID for given Computer
    param([String]$ComputerName)
    
    $newGuid = [PSCustomObject]@{
        PullServer = $ComputerName
        GUID = [guid]::NewGuid()
        }
    return $newGuid
}
