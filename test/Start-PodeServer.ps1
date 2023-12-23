#Requires -Modules @{ ModuleName='Pode'; GUID='e3ea217c-fc3d-406b-95d5-4304ab06c6af'; ModuleVersion='2.9.0' }

# dot-source all *.function.ps1
$GetChildItemParams = @{
    Path = '/'
    Filter = '*.function.ps1'
    File = $true
    Recurse = $true
}
Get-ChildItem @GetChildItemParams | Select-Object -ExpandProperty FullName | ForEach-Object { . $_ }

# Start a PodeServer
$PodeServerParams = @{
    Thread = 2
}
Start-PodeServer @PodeServerParams {

    # Endpoint / Listener
    $PodeEndpointParams = @{
        Address  = '*'
        Port     = 80
        Protocol = 'HTTP'
    }
    Add-PodeEndpoint @PodeEndpointParams

    # Route
    $PodeRouteParams = @{
        Path        = '/'
        Method      = @('GET')
        # Define the Route's answer
        ScriptBlock = {
            Write-PodeJsonResponse -Value @{
                Users = @(
                    @{
                        Name = 'Deep Thought'
                        Age  = 42
                    },
                    @{
                        Name = 'Leeroy Jenkins'
                        Age  = 1337
                    }
                )
            }
        }
    }
    Add-PodeRoute @PodeRouteParams

}
