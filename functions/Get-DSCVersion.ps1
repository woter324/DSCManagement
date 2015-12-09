function Get-DSCVersion
{
    $CIM = Get-CimInstance Win32_OperatingSystem
    $PSV = $PSVersionTable.psversion
    
    $data = [pscustomobject]@{
        PSVersion = "$($PSV.Major).$($PSV.Minor)"
        OSVerNumber = [version]$CIM.version
        OSVerName = $CIM.caption
        OSArchitecture = $CIM.OSArchitecture
    }
    $data
}
