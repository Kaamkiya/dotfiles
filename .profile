append_path () {
    case ":$PATH:" in
        *:"$1":*)
            ;;
        *)
            PATH="${PATH:+$PATH:}$1"
    esac
}

append_path '/usr/local/sbin'
append_path '/usr/local/bin'
append_path '/usr/bin'
append_path "$HOME/.local/bin"
append_path "$HOME/.cargo/bin"
append_path "$HOME/.bun/bin"
append_path "$HOME/.deno/bin"
append_path "$(go env GOPATH)"
append_path "/usr/local/go/bin"
append_path "/usr/lib/jvm/java-21-openjdk/bin"

export PATH
if test -d /etc/profile.d/; then
    for profile in /etc/profile.d/*.sh; do
        test -r "$profile" && . "$profile"
    done
    unset profile
fi
unset -v GLOBSORT
unset -f append_path
if test "$BASH" &&\
   test "$PS1" &&\
   test -z "$POSIXLY_CORRECT" &&\
   test "${0#-}" != sh &&\
   test -r /etc/bash.bashrc
then
    . /etc/bash.bashrc
fi
unset TERMCAP
unset MANPATH

export EDITOR="hx"
export MOZ_ENABLE_WAYLAND=1
export _JAVA_AWT_WM_NONREPARENTING=1
if [ -z "$XDG_RUNTIME_DIR" ]; then
    export XDG_RUNTIME_DIR="/run/user/$(id -u)"
fi

#source "$HOME/.config/bash/bashrc"
if [ -f "$HOME/.bashrc" ]; then
    . "$HOME/.bashrc"
fi
