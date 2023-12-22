Function Connect-MgGraphContainer {

    <#

        .SYNOPSIS
        Wrapper for Connect-MgGraph

        .DESCRIPTION
        Wrapper for Connect-MgGraph

    #>

    [CmdletBinding()]
    param(
        $TenantId = (Get-ChildItem / -Filter 'MgGraphContainer.TenantId.*' -Recurse | Select-Object -First 1 | ForEach-Object { Get-Content $_ -Raw }),
        $ClientId = (Get-ChildItem / -Filter 'MgGraphContainer.ClientId.*' -Recurse | Select-Object -First 1 | ForEach-Object { Get-Content $_ -Raw }),
        $Certificate = (Get-ChildItem / -Filter 'MgGraphContainer.Certificate.pfx' -Recurse | Select-Object -First 1 | ForEach-Object { $_ | Get-X509Certificate2 })
    )

    $ConnectMgGraphParams = @{
        TenantId    = $TenantId
        ClientId    = $ClientId
        Certificate = $Certificate
    }

    Connect-MgGraph @ConnectMgGraphParams

}
