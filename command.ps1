# dot-source all *.function.ps1
$GetChildItemParams = @{
    Path    = '/'
    Filter  = '*.function.ps1'
    File    = $true
    Recurse = $true
}
Get-ChildItem @GetChildItemParams | Select-Object -ExpandProperty FullName | ForEach-Object { . $_ }

Write-Host $MyInvocation.MyCommand.Definition

Write-Host 'Adjust this example file to suit your needs'
Write-Host 'differences between a "regular" || "service" container:'

# regular
Write-Host $("`n"*2)
Write-Host 'Example of a regular container:'
Write-Host 'Container will exit after the task is done'
Write-Host 'Hello World'
Write-Host '..done'

# service
Write-Host $("`n"*2)
Write-Host 'Example of a service container:'
Write-Host '= a terminal blocking task - as there is no "done" -> the container will provide service until the main task throws'
Write-Host 'If you are running an interactive session: Press ctrl+c to terminate the listener'
& './test/Start-PodeServer.ps1'
