function Start-PrimaryMenuExecution
{
    param([int]$source)
    
    switch ($source)
    {
        1{
            Write-Host "Install required DSC modules."
            Get-PSGalleryToolsInstallOptions
         }
        2{Write-Host "Setup server as DSC Pull server."}
        3{Write-Host "Send Pull Server config to target node(s)."}
    }
}
