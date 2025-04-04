#!/bin/sh

pkgs=(
  # Basic, everyday commands.
  'git'
  'wget'
  'curl'
  'xz'     # Void Linux is very minimal, so yes, you do have to install xz-utils yourself.
  'zip'
  'unzip'
  'make'

  # Utilities
  'jq'     # JSON processor
  'xtools' # Tools for working with XBPS (xi, xrs, etc)

  # Languages
  'tcc'      # C compiler
  'gcc'      # C compiler dependencies
  'go'       # Go compiler

  # Desktop
  'sway'          # Window manager
  'glfw-devel'    # Dependencies for sway
  'mako'          # Notification daemon
  'kitty'         # A terminal
  'fuzzel'        # App launcher
  'i3status-rust' # Swaybar content generator

  # Fun things, not necessarily useful
  'fastfetch'   # A quick system fetch
)

YELLOW="\033[0;93m"
RESET="\033[0m"

if [ "$EUID" -ne 0 ]; then
  echo -e "${YELLOW}Must be run as root. Exiting."
  exit 1
fi

if hash xbps-install 2>/dev/null; then
  echo "${YELLOW}xbps is not installed on your system. Exiting."
  echo "${RESET}"
  exit 1
fi

# Update and upgrade packages.
xbps-install -Syu

# Install packages.
for package in ${pkgs[@]}; do
  xbps-install $package
done
