#Requires -Modules @{ ModuleName='Microsoft.Graph.Authentication'; GUID='883916f2-9184-46ee-b1f8-b6a2fb784cee'; ModuleVersion='2.11.1' }
#Requires -Modules @{ ModuleName='MgGraphContainer'; GUID='4ebce2f4-63e0-4689-a2a9-98421e909946'; ModuleVersion='0.1' }

# Test MgGraph connection
Connect-MgGraphContainer
Get-MgContext
Disconnect-MgGraph
