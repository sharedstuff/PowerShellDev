$GetChildItemParams = @{
    Path    = Join-Path $PSScriptRoot 'Public'
    Recurse = $true
    File    = $true
    Filter  = '*.ps1'
}
Get-ChildItem @GetChildItemParams | ForEach-Object { . $_.FullName }
