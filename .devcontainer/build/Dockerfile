# https://hub.docker.com/_/debian
ARG Container_DebianTag=bookworm-slim
FROM debian:${Container_DebianTag}

# Add the context to the container
ADD . /build

# Install-Docker
RUN /build/Install-Docker.sh

# Install-PowerShell
RUN /build/Install-PowerShell.sh

# Set SHELL to pwsh
SHELL [ "pwsh", "-NoProfile", "-Command", "$ErrorActionPreference = 'Stop';", "$ProgressPreference = 'SilentlyContinue';" ]

# Set PSGallery trusted
RUN Set-PSRepository PSGallery -InstallationPolicy trusted

# Install PowerShell_Module(s) by ARG
ARG PowerShell_ModuleFolder='/usr/local/share/powershell/Modules'
ARG PowerShell_InstallModuleFast

# Install-ModuleFast
RUN /build/Install-ModuleFast.ps1

# Workdir will be /workspace (VSCode convention)
WORKDIR /workspace

# Healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "pwsh", "-NoProfile", "-Command", "$ErrorActionPreference = 'Stop';", "$ProgressPreference = 'SilentlyContinue';", "Get-Date" ]
