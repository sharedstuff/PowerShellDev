$GetChildItemParams = @{
    Path    = Join-Path $PSScriptRoot 'Public'
    Recurse = $true
    File    = $true
    Filter  = '*.ps1'
}
Get-ChildItem @GetChildItemParams | Where-Object { $_.BaseName -like '*.Function' -or $_.BaseName -like '*.Class' } | ForEach-Object { . $_.FullName }
