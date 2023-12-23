#Requires -Modules @{ ModuleName='Microsoft.Graph.Authentication'; GUID='883916f2-9184-46ee-b1f8-b6a2fb784cee'; ModuleVersion='2.11.1' }

# dot-source all *.function.ps1
$GetChildItemParams = @{
    Path    = '/'
    Filter  = '*.function.ps1'
    File    = $true
    Recurse = $true
}
Get-ChildItem @GetChildItemParams | Select-Object -ExpandProperty FullName | ForEach-Object { . $_ }

# Test MgGraph connection
Connect-MgGraphContainer
Get-MgContext
Disconnect-MgGraph
