#Requires -Modules @{ ModuleName='Microsoft.Graph.Authentication'; GUID='883916f2-9184-46ee-b1f8-b6a2fb784cee'; ModuleVersion='2.11.1' }
#Requires -Modules @{ ModuleName='MgGraphContainer'; GUID='4ebce2f4-63e0-4689-a2a9-98421e909946'; ModuleVersion='0.1' }

# Test: Connect-MgGraph(Container)
# https://learn.microsoft.com/en-us/powershell/module/microsoft.graph.authentication/connect-mggraph

# Connect Mg-Graph(Container)
Connect-MgGraphContainer

# Retrieve the Context
Get-MgContext

# Disconnect
Disconnect-MgGraph
