#Requires -Modules @{ ModuleName='Microsoft.Graph.Authentication'; GUID='883916f2-9184-46ee-b1f8-b6a2fb784cee'; ModuleVersion='2.11.1' }
#Requires -Modules @{ ModuleName='OnBoardModule'; GUID='6f0bfaba-4897-4d3a-9faf-4f4e321c0e17'; ModuleVersion='0.1' }

# Test MgGraph connection
Connect-MgGraphContainer
Get-MgContext
Disconnect-MgGraph
