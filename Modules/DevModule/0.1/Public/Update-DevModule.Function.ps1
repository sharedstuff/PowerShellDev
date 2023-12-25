Function Update-DevModule {

    <#

        .SYNOPSIS
        Resets the OnBoardModule manifest

        .DESCRIPTION
        Resets the OnBoardModule manifest

    #>

    [CmdletBinding()]
    param(
        $Path = (Join-Path $PSScriptRoot '/../DevModule.psd1')
    )

    $ModuleManifest = Import-PowerShellDataFile $Path

    $ModuleManifest.Remove('PrivateData')
    $ModuleManifest.VariablesToExport=@()


    $GetChildItemParams = @{
        Path    = $PSScriptRoot
        Recurse = $true
        File    = $true
        Filter  = '*.ps1'
    }
    $ChildItems = Get-ChildItem @GetChildItemParams
    $ModuleManifest.FunctionsToExport = ($ChildItems.BaseName).Replace('.Function',$null) | Sort-Object


    $ModuleManifest | Write-Verbose

    New-ModuleManifest @ModuleManifest -Path $Path

}
