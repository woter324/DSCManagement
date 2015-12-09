

#$ProxyComputerName = "myProxyServer"

#if(Test-Connection $ProxyCopmuterName -Count 1 -Quiet)
#{
#    $global:PSDefaultParameterValues = @{
#        'Invoke-RestMethod:Proxy'="http://$ProxyCopmuterName:8080"
#        'Invoke-WebRequest:Proxy'="http://$ProxyCopmuterName:8080"
#        '*:ProxyUseDefaultCredentials'=$true
#    }
#}

function Get-Proxy
{
    
    $key = Get-Item -Path 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings'
    $value = Get-ItemProperty $key.PSPath
    #$value
    if($value.ProxyServer -eq $null)
    {
        Write-Host "No proxy configured for Current User: $($env:username)@$($env:USERDNSDOMAIN)"
    }
    else
    {
        $value.ProxyServer  
    }
}

#Get-Proxy

#Get-WmiObject -Class Win32_UserAccount -Namespace "root\cimv2" -ComputerName $($env:computername)

#Get-WmiObject -Class Win32_userprofile | Select 

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
    $localUsers | New-MenuItems2
    
    #| ForEach-Object {
        #New-MenuItems -NumberOfOptions 1 -Name $_ -Description "" -Task ""
        # New-MenuItems2 -AsObject "blah" 
    #}
}

New-LocalUserMenu

<#
Add-Type -AssemblyName System.Security

# You can do more filtering here if there are other cert requirements...
$ValidCerts = [System.Security.Cryptography.X509Certificates.X509Certificate2[]](dir Cert:\CurrentUser\My | where { $_.NotAfter -gt (Get-Date) })

# You could check $ValidCerts, and not do this prompt if it only contains 1...
$Cert = [System.Security.Cryptography.X509Certificates.X509Certificate2UI]::SelectFromCollection(
    $ValidCerts,
    'Choose a certificate',
    'Choose a certificate',
    'SingleSelection'
) | select -First 1

$IwrParams = @{
    Uri = $Url       # Uri to file to download
    OutFile = $Path  # Path to where file should be downloaded (include filename)
    Certificate = $Cert
}
#Invoke-WebRequest @IwrParams



(New-Object System.Net.WebClient).Proxy.Credentials = [System.Net.CredentialCache]::DefaultNetworkCredentials


#wget  -uri "https://download.microsoft.com/download/4/1/A/41A369FA-AA36-4EE9-845B-20BCC1691FC5/PackageManagement_x64.msi"

#>
