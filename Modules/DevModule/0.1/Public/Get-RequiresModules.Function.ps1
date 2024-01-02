Function Get-RequiresModules {

    <#

        .SYNOPSIS
        Generates #Requires for Modules

        .DESCRIPTION
        Generates #Requires for Modules

    #>

    [CmdletBinding()]
    param (

        # Module Name
        [Parameter(ValueFromPipeline, ValueFromPipelineByPropertyName)]
        [Alias('Name', 'ModuleName')]
        [string[]]
        $InputObject = '*'

    )

    process {

        $InputObject | ForEach-Object {
            Get-Module -Name $_ -ListAvailable | Select-Object Name, Guid, Version | Sort-Object Name, Guid -Unique | Sort-Object Name, Guid, Version | ForEach-Object {
                "#Requires -Modules @{ ModuleName='$($_.Name)'; GUID='$($_.Guid)'; ModuleVersion='$($_.Version)' }"
            }
        }

    }

}
