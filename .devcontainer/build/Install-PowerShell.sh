#!/bin/sh

# ---
# https://learn.microsoft.com/en-us/powershell/scripting/install/install-debian?view=powershell-7.3#installation-on-debian-11-via-package-repository
# ---

# added: prerequisites
apt update && apt install -y ca-certificates curl gnupg

# Paste & Copy:

# Save the public repository GPG keys
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --yes --dearmor --output /usr/share/keyrings/microsoft.gpg

# Register the Microsoft Product feed
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft.gpg] https://packages.microsoft.com/repos/microsoft-debian-bullseye-prod bullseye main" > /etc/apt/sources.list.d/microsoft.list'

# Install PowerShell
apt update && apt install -y powershell
