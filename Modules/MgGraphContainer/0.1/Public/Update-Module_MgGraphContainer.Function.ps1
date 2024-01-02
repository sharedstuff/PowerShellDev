Function Update-Module_MgGraphContainer {

    <#

        .SYNOPSIS
        Updates this Module's manifest

        .DESCRIPTION
        Updates this Module's manifest

    #>

    [CmdletBinding()]
    param(
        $Path = (Get-ChildItem (Join-Path $PSScriptRoot '..') -Filter '*.psd1')
    )

    $GetChildItemParams = @{
        Path    = $PSScriptRoot
        Recurse = $true
        File    = $true
        Filter  = '*.ps1'
    }
    $ChildItems = Get-ChildItem @GetChildItemParams

    $UpdateModuleManifestParams = @{
        Path              = $Path
        FunctionsToExport = $ChildItems.BaseName | Where-Object { $_ -like '*.Function' } | ForEach-Object { $_.Replace('.Function', $null) } | Sort-Object
    }
    Update-ModuleManifest @UpdateModuleManifestParams

    $ImportModuleParams = @{
        Name  = $Path
        Scope = 'Global'
        Force = $true
    }
    Import-Module @ImportModuleParams

}
