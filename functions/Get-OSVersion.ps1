function Get-OSVersion
{
    param(
        [version]$OSVer,
        [version]$Oldest,
        [version]$Newest
        )
    
    #[version]$OSVer = (Get-DSCVersion).OSVerNumber
    $fullVerNumber = $OSVer
    $osver
    [version]$OSVer = "$($OSVer.major).$($OSVer.Minor)"

    if(!$oldest -eq $null)
    {
        [version]$oldV = "$($oldest.Major).$($oldest.Minor)"
    }
    if(!$newest -eq $null)
    {
        [version]$newV = "$($newest.Major).$($newest.Minor)"
    }

    if (($OSVer -ge $oldV) -and ($OSVer -le $newV))
    {
        $result = "OK"
        $bool = $true      
    }
    elseif($OSVer -lt $oldV)
    {
        $result = "Too Old"
        $bool = $false      
    }
    elseif($OSVer -gt $newV)
    {
        $result = "Too New"
        $bool = $false      
    }
    else
    {
        $result = "Unnown"
        $bool = "Unknown"        
    }
    $Out = [pscustomobject]@{
            OsVersion = $fullVerNumber.ToString()
            OsVerObj = $fullVerNumber
            OsVerMM = $OSVer
            Result = $result
            Bool = $bool
    }
    return $Out
}
