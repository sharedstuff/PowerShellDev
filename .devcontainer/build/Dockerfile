# https://hub.docker.com/_/alpine
ARG Container_AlpineTag=3.18
FROM alpine:${Container_AlpineTag}

# Update & Upgrade
RUN apk add --no-cache --upgrade apk-tools \
    && apk update --no-cache \
    && apk upgrade --no-cache --available \
    && sync

# Install requirements
# https://learn.microsoft.com/en-us/powershell/scripting/install/install-alpine
RUN apk add --no-cache \
    ca-certificates \
    less \
    ncurses-terminfo-base \
    krb5-libs \
    libgcc \
    libintl \
    libssl1.1 \
    libstdc++ \
    tzdata \
    userspace-rcu \
    zlib \
    icu-libs \
    curl

RUN apk -X https://dl-cdn.alpinelinux.org/alpine/edge/main add --no-cache \
    lttng-ust

# Install compatibility / convinience packages
RUN apk add --no-cache \
    bash \
    gcompat \
    git \
    icu-data-full \
    musl \
    openssl

# Install Docker
RUN apk add --no-cache docker openrc && rc-update add docker boot

# Download the powershell '.tar.gz' archive
ARG PowerShell_Version=7.4.0
ARG PowerShell_Package=powershell-${PowerShell_Version}-linux-musl-x64.tar.gz
ARG PowerShell_DownloadURL=https://github.com/PowerShell/PowerShell/releases/download/v${PowerShell_Version}/${PowerShell_Package}
ADD ${PowerShell_DownloadURL} /tmp/powershell.tar.gz

# Create the target folder where powershell will be placed
# Expand powershell to the target folder
# Set execute permissions
# Create the symbolic link that points to pwsh
# CleanUp
RUN mkdir -p /opt/microsoft/powershell/7 \
    && tar zxf /tmp/powershell.tar.gz -C /opt/microsoft/powershell/7 \
    && chmod +x /opt/microsoft/powershell/7/pwsh \
    && ln -s /opt/microsoft/powershell/7/pwsh /usr/bin/pwsh \
    && rm /tmp/powershell.tar.gz

# Set SHELL to pwsh
SHELL [ "pwsh", "-NoProfile", "-Command", "$ErrorActionPreference = 'Stop';", "$ProgressPreference = 'SilentlyContinue';" ]

# Workdir will be /workspace (VSCode convention)
WORKDIR /workspace

# Healthcheck
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 CMD [ "pwsh", "-NoProfile", "-Command", "$ErrorActionPreference = 'Stop';", "$ProgressPreference = 'SilentlyContinue';", "Get-Date" ]

# Set PSGallery trusted
RUN Set-PSRepository PSGallery -InstallationPolicy trusted

# Install-Module Mdbc (12c81cd8-bde3-4c91-a292-e6c4f868106a)
ARG PowerShell_Module_Mdbc_RequiredVersion=6.6.5
RUN Install-Module Mdbc -RequiredVersion ${PowerShell_Module_Mdbc_RequiredVersion} -Scope AllUsers

# Install-Module Microsoft.Graph (fceec1eb-c2e8-4b2b-a120-0fab3f0d7b47)
ARG PowerShell_Module_MicrosoftGraph_RequiredVersion=2.11.1
RUN Install-Module Microsoft.Graph -RequiredVersion ${PowerShell_Module_MicrosoftGraph_RequiredVersion} -Scope AllUsers

# Install-Module Pode (e3ea217c-fc3d-406b-95d5-4304ab06c6af)
ARG PowerShell_Module_Pode_RequiredVersion=2.9.0
RUN Install-Module Pode -RequiredVersion ${PowerShell_Module_Pode_RequiredVersion} -Scope AllUsers
