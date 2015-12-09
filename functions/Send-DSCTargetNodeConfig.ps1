function Send-DSCTargetNodeConfig
{ 
    param
    (
        [Parameter(
            Position=0,
            Mandatory=$true,
            ValueFromPipeline=$true,
            ValueFromPipelineByPropertyName=$true
        )]
        [string[]]$TargetNodes,
        [string]$OutputPath = ".\"
    )
    
    Begin
    {
        Write-Verbose "Initialising script..."
        #Use the parameters in the CSV file to generate the "SetPullMode" MOF
        #Import-Module \\londata001\wintel\Engineer\Adrian\Scripts\DSC\DSC.Management -Force

        #Read the CSV file containing PullServer details
        $PullServerGuid = (Get-PullServerGuidCSV).Guid
        $PullServer = (Get-PullServerGuidCSV).PullServer
    }
    
    Process 
    {
        $TargetNodes | ForEach-Object{
            $testResult = Test-Connection -ComputerName $_ -quiet -count 2
            
            if($testResult) 
            {
                Write-Verbose "Creating MOF file for $_ ." 
                $setResult = SetPullMode -PullServerGuid $PullServerGuid -PullServer $PullServer -AgentTargetComputerName $_ -OutputPath $OutputPath
                Write-Verbose "Created MOF File ($($setResult.FullName))."
                
                Write-Verbose "Pushing configuration to target ($_)."
                Set-DSCLocalConfigurationManager -Path "$($OutputPath)\SetPullMode" -ErrorAction SilentlyContinue
                Write-Verbose "Configuration sent to target."
            }
            else
            {
                Write-Verbose "Cannot reach host: '$_'!"
            }
        }
    }

    End
    {
        Write-Verbose "Script function complete."
    }
}
