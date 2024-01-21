# https://hub.docker.com/_/debian
ARG Container_DebianTag=bookworm-slim
FROM debian:${Container_DebianTag}

# Install-Docker
ADD ./Install-Docker.sh /build/Install-Docker.sh
RUN /build/Install-Docker.sh

# Install-PowerShell
ADD ./Install-PowerShell.sh /build/Install-PowerShell.sh
RUN /build/Install-PowerShell.sh

# Set SHELL to pwsh
SHELL [ "pwsh", "-NoProfile", "-Command", "$ErrorActionPreference = 'Stop';", "$ProgressPreference = 'SilentlyContinue';" ]

# Set PSGallery trusted
RUN Set-PSRepository PSGallery -InstallationPolicy trusted

# Install-ModuleFast / Install PowerShell_Module(s) by ARGs
ARG PowerShell_ModuleFolder='/usr/local/share/powershell/Modules'
ARG PowerShell_InstallModuleFast
ADD ./Install-ModuleFast.ps1 /build/Install-ModuleFast.ps1
RUN /build/Install-ModuleFast.ps1

# Workdir will be /workspace (VSCode convention)
WORKDIR /workspace

# Healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "pwsh", "-NoProfile", "-Command", "$ErrorActionPreference = 'Stop';", "$ProgressPreference = 'SilentlyContinue';", "Get-Date" ]
