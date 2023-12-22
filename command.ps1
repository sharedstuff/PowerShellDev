# dot-source all *.function.ps1
$GetChildItemParams = @{
    Path = '/'
    Filter = '*.function.ps1'
    File = $true
    Recurse = $true
}
Get-ChildItem @GetChildItemParams | Select-Object -ExpandProperty FullName | ForEach-Object { . $_ }

Write-Host 'Container started'

# task || a one-time job
do {
    Write-Host 'Hello World'
} until ($true)

Write-Host 'Container stopped'
