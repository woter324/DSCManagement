function Start-DSCManagement
{
    Start-Menu -Confirm:$false `
        -NumberOfOptions 2 `
        -Name "Install prerequisites.","Configure a DSC Pull server.","Send DSC Pull Server Config to target node." `
        -Description "Install required DSC modules.", "Setup server as DSC Pull server.","Send Pull Server config to target node(s)." `
        -Task "Start-PrimaryMenuExecution -source 1","Start-PrimaryMenuExecution -source 2","Start-PrimaryMenuExecution -source 3"
}
