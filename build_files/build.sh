#!/usr/bin/env bash

set -ouex pipefail

# Copy Files to Container
rsync -rvK /ctx/system_files/ /

# Install COPR Repos
/ctx/00-install-copr-repos.sh

# Install/Uninstall Packages
/ctx/01-packages.sh

# Install Google Fonts
/ctx/02-google-fonts.sh

# Install Nerd Fonts
/ctx/03-nerd-fonts.sh

# Cleanup
/ctx/04-cleanup.sh

# Regenerate initramfs to remove dinosaur branding in Plymouth
/ctx/05-initramfs.sh
