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

  # Languages
  'tcc'      # C compiler
  'glibc-devel' # C compiler dependencies
  'go'       # Go compiler

  # These are useful for GUI environments/computers with desktops.
  'kitty'     # A terminal.
  'firefox'   # A browser.

  # Fun things, not necessarily useful.
  'fastfetch'   # A quick system fetch.
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
