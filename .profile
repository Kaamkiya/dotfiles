if [ -n "$BASH_VERSION" ]; then
    if [ -f "$HOME/.bashrc" ]; then
      . "$HOME/.bashrc"
    fi
fi
if [ -d "$HOME/bin" ]; then
    PATH="$HOME/bin:$PATH"
fi
if [ -d "$HOME/.local/bin" ]; then
    PATH="$HOME/.local/bin:$PATH"
fi
export $(dbus-launch)
export PATH="$PATH:/usr/local/go/bin"
export PATH="$PATH:$(go env GOPATH)/bin"
