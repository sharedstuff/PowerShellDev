# PowerShellDev  
PowerShell DevContainer (runtime environment) that aims to ease the development of PowerShell Docker Containers  
  
  
## Content  
- PowerShell DevContainer (@Alpine)  
- Preinstalled PowerShell Modules: Microsoft.Graph, Mdbc  
- Mongo(DB)  
  

## Changelog  
  
### 2023-12-22 Initial commit  
- Alpine 3.18  
- PowerShell 7.4.0  
- PowerShell Module Microsoft.Graph 2.11.1  
- PowerShell Module Mdbc 6.6.5  
- Mongo 7-jammy  
  

## Structure & Logic  
\* ignored by git  
  
### /.devcontainer  
provides a DevContainer definition / runtime environment  
  
### /.vscode  
some vscode workspace settings  
  
### /config *  
config files consumed by DevContainer  
  
#### /config/MgGraphContainer.Certificate.pfx  
the Certificate used by Connect-MgGraph(Container)
  
#### /config/MgGraphContainer.ClientId  
the ClientId used by Connect-MgGraph(Container)  
  
#### /config/MgGraphContainer.TenantId  
the TenantId used by Connect-MgGraph(Container)  

### /data *  
DevContainer's persistant storage (bind-mounts)  
  
### /public  
public PowerShell functions  
  
### /test  
PowerShell Test-Functions  
  
### command.ps1  
the containers main command  
  