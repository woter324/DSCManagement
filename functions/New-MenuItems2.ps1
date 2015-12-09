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
    
    Process 
    {
        $data=@()
        if($ItemsAsObject -ne $null)
        {
            "blah"
            
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
