function Start-Menu
{
    [CmdletBinding(SupportsShouldProcess=$true,ConfirmImpact='High')]
    param(
        [Parameter(Mandatory=$true)]
        [int]$NumberOfOptions=1,
        [Parameter(Mandatory=$true)]
        [string[]]$Name,
        [Parameter(Mandatory=$true)]
        [string[]]$Description,
        [Parameter(Mandatory=$true)]
        [object]$Task
    ) 

    $menu = New-MenuItems -NumberOfOptions $NumberOfOptions -Name $Name -Description $Description -Task $Task
    
    #Show menu:
    $showMenu = $menu | select Number,Name,Description | ft -AutoSize
    #clear-host
    $showMenu | Out-Host -Paging
    
    $Selection = Read-Host "Please make a selection (0-$($menu.count-1)) from the above options"
    $MenuSelected = $Menu | Where-Object{$_.Number -eq $Selection} 

    Write-Host "You seleted option $($Selection). $($MenuSelected.Name), $($MenuSelected.Description)."
    Write-Host "`tTask: $($MenuSelected.Task).`r`n" -ForegroundColor yellow 
    
    if($MenuSelected.Name -ne "Exit")
    { 
        if($PSCmdlet.ShouldProcess($env:COMPUTERNAME,$($MenuSelected.Task)))
        {            
            $myTask = $MenuSelected.Task
            $cmdlet = [scriptblock]::Create($MenuSelected.Task)
            $cmdlet.invoke()
        }
        else
        {
            Write-Host "---CANCELLED BY USER!---" -ForegroundColor Red
        }
    }
}


#Start-Menu -NumberOfOptions 2 -name "Upgrade to PS 5.0.","Install PackageManagment PS Module (MSI)." -Description "In 'Technical Preview'."," " -Task "Start-MenuExecution -source 3","Start-MenuExecution -source 4"
