function New-MenuItems2
{

    [CmdletBinding()]
    param
    (
        [Parameter(Position=0,mandatory=$true,ValueFromPipeline=$true)]
        [psobject[]]$ItemsAsObject,
        [int]$NumberOfOptions,
        [string[]]$Name,
        [string[]]$Description,
        [object]$Task
    )
    
    Begin
    {
        $objects=@()
        $data=@()
        $c = 0
    }
    
    Process 
    {
        $data=@()
        if($ItemsAsObject -ne $null)
        {
            "blah"
            $c
            for($i = 1; $i -le $ItemsAsObject.count;$i++)
            {
                $data += [pscustomobject]@{
                    Number = $i
                    Name = $ItemsAsObject[$i-1].Name
                    #Description = $Description[$i-1]
                    #Task = $task[$i-1] 
                }
            }
        }
        else
        {
            #$data=@()
            for($i = 1; $i -le $NumberOfOptions; $i++)
            {
                $data += [pscustomobject]@{
                    Number = $i
                    Name = $Name[$i-1]
                    Description = $Description[$i-1]
                    Task = $task[$i-1] 
                }
            }
        }
        $data += [pscustomobject]@{
             Number = 0
             Name = "Exit"
             Description = "Exit Menu"
             Task = "exit"
        }
    return $data
    }
}


function Get-LocalUsers
{
    $path = 'HKLM:\Software\Microsoft\Windows NT\CurrentVersion\ProfileList\*'
    $Key = Get-Item -Path $path
    $Values = Get-ItemProperty $key.PSPath
    
    $results=@()
    $values | ForEach-Object {
        $SID = New-Object System.Security.Principal.SecurityIdentifier($_.PSChildName)
        $User = $sid.Translate([System.Security.Principal.NTAccount])
        $Parent = $_.PSParentPath  
        
        $results += [pscustomobject]@{
            SID = $SID
            User = $user
            State = $_.State
        }
    }
    $results
}

function New-LocalUserMenu
{
    $localUsers = Get-LocalUsers | Where-Object {$_.State -ne "0"} | select User
    #$test = @{"cat" = "BSH";"dog" = "Great Dane"}
    #$test | New-MenuItems2
     
    $localUsers | New-MenuItems2
    #| ForEach-Object {
    #    New-MenuItems2 -NumberOfOptions 1 -Name $_ -Description "" -Task ""
    #}
}

New-LocalUserMenu
