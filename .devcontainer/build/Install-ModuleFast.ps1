if ($env:PowerShell_InstallModuleFast) {

    # Load ModuleFast on-the-fly
    Invoke-WebRequest 'bit.ly/modulefast' | Invoke-Expression

    # Create ModuleFolder
    $ModuleFolder = $env:PowerShell_ModuleFolder
    if (-not (Test-Path $ModuleFolder)) { New-Item $ModuleFolder -ItemType Directory }

    # Install Modules using Install-ModuleFast
    $Modules = $env:PowerShell_InstallModuleFast | Invoke-Expression
    $Modules | ConvertTo-Json

    Install-ModuleFast $Modules -Destination $ModuleFolder -Verbose

}
