Function Get-X509Certificate2 {

    <#

        .SYNOPSIS
        Creates a X509Certificate2 object to be used as a authentication factor for MgGraph

        .DESCRIPTION
        Creates a X509Certificate2 object to be used as a authentication factor for MgGraph

        .OUTPUTS
        System.Security.Cryptography.X509Certificates.X509Certificate2
        Returns the needed type for Connect-MgGraph -Certificate

        .EXAMPLE

        $ConnectMgGraphParams = @{
            TenantId    = ...
            ClientId    = ...
            Certificate = mergedwithoutsecret.pfx | Get-MgGraphX509Certificate2
        }
        Connect-MgGraph @ConnectMgGraphParams

    #>

    [CmdletBinding()]
    param(

        # Specifies the path of the certificate used.
        [Parameter(Mandatory, ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [string]
        $Path,

        # Specifies the secret for the certificate.
        [Parameter(ValueFromPipelineByPropertyName)]
        [string]
        $Secret

    )

    process {

        # fix Secret if null
        if (-not $Secret) { $Secret = '' }

        $Flags = @(
            [System.Security.Cryptography.X509Certificates.X509KeyStorageFlags]::Exportable
            [System.Security.Cryptography.X509Certificates.X509KeyStorageFlags]::MachineKeySet
        )

        [System.Security.Cryptography.X509Certificates.X509Certificate2]::new($Path, $Secret, $Flags)

    }

}
