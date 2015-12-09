function Get-PullServerGuidCSV
{
    param
    (
        [String[]]$ComputerName = $env:COMPUTERNAME,
        [string]$path = ".\PullServerGUID.csv"
    )
        $contents = Read-PullServerGuidCSV -path $path
        $contents | Where-Object {$_.PullServer -eq $ComputerName}    
}
