function Write-PullServerGuidCsv
{
    # Writes new GUID to $path.
    [CmdletBinding(SupportsShouldProcess=$true,ConfirmImpact='High')]
    param
    (
        [Parameter(
            Position=0,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true
        )]
        [String]$ComputerName=$env:COMPUTERNAME,
        [string]$path = ".\PullServerGUID.csv"
    )
    
    process
    {
        $data = Test-PullServerGuidCSV -path $path -ComputerName $ComputerName
        $results = $data | ForEach-Object {
            [pscustomobject]@{
                PullServer = $_.PullServer
                ExistingGUID = $_.GUID
                ThisServer = if($_.PullServer -eq $ComputerName){$true}else{$false}
                }
            }
            $Replace  = ($results | Where-Object{$_.thisserver -eq $true}).PullServer
            if($Replace -ne $null)
            {
                Write-Host "There is an existing GUID entry for '$Replace'. Are you sure you want to replace it?" -ForegroundColor magenta
                
                if($PSCmdlet.ShouldProcess("$path","will overwrite the existing GUID value!"))
                {
                    $NewFile = ($results | Where-Object{$_.thisserver -ne $true} | Select PullServer,@{N="GUID";E={$_.ExistingGUID}})
                    #Note: Use of calc Prop changes "ExistingGUID" to "GUID" so $NewFile has matching columns.
                    $NewFile += New-PullServerGuid -ComputerName $ComputerName
                    $NewFile | Export-CSV -Path $path -NoTypeInformation
                }
            }
            else
            {
                #No existing entries. Will append"
                $NewFile = New-PullServerGuid -ComputerName $ComputerName
                $NewFile | Export-CSV -Path $path -NoTypeInformation -Append
            }
    }
}
