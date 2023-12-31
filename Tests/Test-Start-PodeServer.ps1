#Requires -Modules @{ ModuleName='Pode'; GUID='e3ea217c-fc3d-406b-95d5-4304ab06c6af'; ModuleVersion='2.9.0' }

# Test: Start-PodeServer
# https://pode.readthedocs.io/en/latest/Tutorials/Routes/Examples/RestApiSessions

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
    $PodeRoutes = @(
        @{
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
            Verbose     = $true
        }
    )

    $PodeRoutes | ForEach-Object { Add-PodeRoute @_ }

}
