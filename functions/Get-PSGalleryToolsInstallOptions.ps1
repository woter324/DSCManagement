function Get-PSGalleryToolsInstallOptions 
{
    $thisVersion = (Get-DSCVersion).OSVerNumber
    $thisVersion = $thisVersion.ToString()
    #$thisVersion = "6.1"
    #$PSVer = "4.0"
    $PSVer = (Get-DSCVersion).PSVersion
    
    
    if(!(Test-PSGalleryToolsPresence))
    {
        switch ($PSVer.Substring(0,1))
        {
            "5" {
                    Write-Host "`r`nPS version $PSVer detected. Something is wrong as `r`nPS version 5.0 comes with desired cmdlets!" -ForegroundColor Red
                }
            "4" {
                    Write-Host "`r`nPS version $PSVer detected."
                    Start-Menu -NumberOfOptions 2 -name "Upgrade to PS 5.0.","Install PackageManagment (MSI)." -Description "In 'Technical Preview'.","PackageManagement Module for PowerShell 3.0 / 4.0." -Task "Start-MenuExecution -source 3","Start-MenuExecution -source 4" 
                }
            "3" {
                    Write-Host "`r`nPS version $PSVer detected."
                    Start-Menu -NumberOfOptions 2 -name "Upgrade to PS 5.0.","Install PackageManagment PS Module (MSI)." -Description "In 'Technical Preview'."," " -Task "Start-MenuExecution -source 3","Start-MenuExecution -source 4" 
                }
            "2" {
                    if ((Get-OSVersion -OSVer $thisVersion -Oldest "5.1" -Newest "5.2").OSVerMM -le "5.2")
                    {
                        Write-Host "PS version $PSVer and OS version $((Get-OSVersion -OSVer $thisVersion).OSVersion) detected. OS doesn't support PS 3.0. OS Upgrade Required." -ForegroundColor red
                    }
                    elseif ((Get-OSVersion -OSVer $thisVersion -Oldest "5.1" -Newest "5.2").OSVerMM -le "6.0")
                    {
                        Start-Menu -NumberOfOptions 1 -name "Upgrade to PS 3.0." -Description "Not available for Vista.","" -Task "Start-MenuExecution -source 1","" 
                    }
                    elseif ((Get-OSVersion -OSVer $thisVersion -Oldest "6.1" -Newest "6.1").OSVerMM -le "6.1")
                    {
                        Start-Menu -NumberOfOptions 1 -name "Upgrade to PS 3.0." -Description "","" -Task "Start-MenuExecution -source 2","" 
                    }                
                }
            default {Write-Host "`r`nPS version $PSVer detected. PS and/or OS Upgrade Required."}
        }
    }
}
