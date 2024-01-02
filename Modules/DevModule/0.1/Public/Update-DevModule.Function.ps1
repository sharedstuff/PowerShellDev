Function Update-DevModule {

    <#

        .SYNOPSIS
        Resets the OnBoardModule manifest

        .DESCRIPTION
        Resets the OnBoardModule manifest

    #>

    [CmdletBinding()]
    param(
        $Path = (Join-Path $PSScriptRoot '../DevModule.psd1')
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

    $Functions = Get-ChildItem @GetChildItemParams | Where-Object BaseName -like '*.Function'
    $ModuleManifest.FunctionsToExport = ($Functions.BaseName).Replace('.Function',$null) | Sort-Object

    $ModuleManifest | Write-Verbose

    New-ModuleManifest @ModuleManifest -Path $Path

    Get-Module DevModule | Remove-Module
    Import-Module $Path -Force

    # Reload Functions
    $GetChildItemParams = @{
        Path    = $PSScriptRoot
        Recurse = $true
        File    = $true
        Filter  = '*.Function.ps1'
    }
    Get-ChildItem @GetChildItemParams | ForEach-Object { . $_.FullName }

}
