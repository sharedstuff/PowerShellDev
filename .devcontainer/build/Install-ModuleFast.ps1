# Create ModuleFolder
$ModuleFolder = $env:PowerShell_ModuleFolder
if (-not (Test-Path $ModuleFolder)) { New-Item $ModuleFolder -ItemType Directory }

# Load ModuleFast on-the-fly
Invoke-WebRequest 'bit.ly/modulefast' | Invoke-Expression
Install-ModuleFast ModuleFast -Destination $ModuleFolder -Verbose

# Install Modules using Install-ModuleFast
if ($env:PowerShell_InstallModuleFast) {
    $Modules = $env:PowerShell_InstallModuleFast | Invoke-Expression
    Install-ModuleFast $Modules -Destination $ModuleFolder -Verbose
}
