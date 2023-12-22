# dot-source all *.function.ps1
$GetChildItemParams = @{
    Path = '/'
    Filter = '*.function.ps1'
    File = $true
    Recurse = $true
}
Get-ChildItem @GetChildItemParams | Select-Object -ExpandProperty FullName | ForEach-Object { . $_ }

# Test MgGraph connection
Connect-MgGraphContainer
Get-MgContext
Disconnect-MgGraph
