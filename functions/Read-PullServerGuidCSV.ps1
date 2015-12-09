function Read-PullServerGuidCSV
{
    #Checks for existing file and reads in the CSV contents.
    param
    (
        [string]$path
    )
    
    if (Test-Path -Path $path)
    {
        Import-Csv -Path $path
    }
    else
    {
        Write-Error "Path not found: $path"
        return $false
    }
}
