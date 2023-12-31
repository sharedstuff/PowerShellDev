if ($env:PowerShell_InstallModuleFast) {
    # Install Modules using Install-ModuleFast
    $Modules = $env:PowerShell_InstallModuleFast | Invoke-Expression
}
else {
    $Modules = @()
}

$Modules | ConvertTo-Json

# Create ModuleFolder
$ModuleFolder = $env:PowerShell_ModuleFolder
if (-not (Test-Path $ModuleFolder)) { New-Item $ModuleFolder -ItemType Directory }

# Load ModuleFast on-the-fly
Invoke-WebRequest 'bit.ly/modulefast' | Invoke-Expression

# Install-Module(s)
Install-ModuleFast ModuleFast -Destination $ModuleFolder -Verbose
Install-ModuleFast $Modules -Destination $ModuleFolder -Verbose
