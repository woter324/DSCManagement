function Start-MenuExecution
{
    param([int]$source)
    
    switch ($source)
    {
        1{Write-Host "Upgrade to PS 3.0 required. For Server 2008 (non-R2), please install KB968930. (PS 3.0 is not available for Vista)." -ForegroundColor Magenta}
        2{Write-Host "Upgrade to PS 3.0 required. For Server 2008 R2 (SP1) / Windows 7 (SP1), please install KB2506143." -ForegroundColor Magenta}
        3{
            $osVersion = (Get-OSVersion -OSVer $thisVersion)
            if($osVersion.osVerMM -eq "6.1")
            {
                Write-Host "To upgrade to PS 5.0 for Windows Server 2008 R2 (SP1) / Windows 7 (SP1), please install KB3066439." -ForegroundColor Magenta
            }
            elseif($osVersion.osVerMM -eq "6.2")
            {
                Write-Host "To upgrade to PS 5.0 for Windows Server 2012 (non-R2), please install KB2799888." -ForegroundColor Magenta
            }
            elseif($osVersion.osVerMM -eq "6.3")
            {
                Write-Host "To upgrade to PS 5.0 for Windows Server 2012 R2 / Windows 8.1, please install KB3066437." -ForegroundColor Magenta
            }
            else
            {
                Write-Host "PS Version and OS version detected are incompatible or atleast there is no official upgrade path to PS 5.0."
            }
         }
        4{Write-Host "TODO: Download and Install MSI."}
    }
}
