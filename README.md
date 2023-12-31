# PowerShellDev  
PowerShell DevContainer (runtime environment) that aims to ease the development of PowerShell Docker Containers  
  
## Content  
- PowerShell DevContainer (@Debian 12 (Bookworm) Slim)  
- Preinstalled PowerShell Modules  
- Mongo(DB)  
- examples  
  
## Specs  
- Debian 12 (Bookworm) Slim
- PowerShell 7.4.0  
- PowerShell Modules:  
  - Mdbc 6.6.5 (12c81cd8-bde3-4c91-a292-e6c4f868106a)  
  - Microsoft.Graph 2.11.1 (fceec1eb-c2e8-4b2b-a120-0fab3f0d7b47)  
  - Pode 2.9.0 (e3ea217c-fc3d-406b-95d5-4304ab06c6af)  
- Mongo 7-jammy  
  
## Structure & Logic  
  
### /.devcontainer  
provides a DevContainer definition / runtime environment  
  
---  
  
### /.vscode  
some vscode workspace settings  
  
---  
  
### /config *  
config files consumed by DevContainer  
  
#### /config/MgGraphContainer.Certificate.pfx *  
the Certificate used by Connect-MgGraph(Container)
  
#### /config/MgGraphContainer.ClientId *  
the ClientId used by Connect-MgGraph(Container)  
  
#### /config/MgGraphContainer.TenantId *  
the TenantId used by Connect-MgGraph(Container)  
  
---  
  
### /data *  
DevContainer's persistant storage (bind-mounts)  
  
---  
  
### /Modules  
custom PowerShell Modules  
  
---  
  
### /test  
misc. PowerShell scripts  
  
---  
  
### #oneshot.ps1  
Example of a #oneshot (ephemeral) container  
  
---  
  
### #service.ps1  
Example of a (persistant) #service container  
  
---  
  
\* = .gitignore(d)  
  