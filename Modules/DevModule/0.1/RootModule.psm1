$GetChildItemParams = @{
    Path    = Join-Path $PSScriptRoot 'Public'
    Recurse = $true
    File    = $true
    Filter  = '*.Function.ps1'
}
Get-ChildItem @GetChildItemParams | ForEach-Object { . $_.FullName }
