function New-MenuItems
{
    param
    (
        [int]$NumberOfOptions,
        [string[]]$Name,
        [string[]]$Description,
        [object]$Task
    )
    
    $data=@()
    for($i = 1; $i -le $NumberOfOptions; $i++)
    {
        $data += [pscustomobject]@{
            Number = $i
            Name = $Name[$i-1]
            Description = $Description[$i-1]
            Task = $task[$i-1] 
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
