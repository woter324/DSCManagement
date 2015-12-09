function Test-PSGalleryToolsPresence
{
    $CmdNameRequired = "Find-Module"
    #$CmdNameRequired = "Get-Service"
    
    $RetVal = Get-Command | Where-Object {$_.Name -eq $CmdNameRequired}
  
    if(!$RetVal)
    {
        Return $false
    }
    else
    {
        return $true     
    }
}
