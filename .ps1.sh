__make_ps1() {
    local color_reset="\[\033[m\]"
    local color_success="\[\033[0;32m\]" # green
    local color_failure="\[\033[0;31m\]" # red

    local cwd_color="\[\033[0;34m\]" # blue
    local cwd="$cwd_color\w$color_reset"

    if [ $? -eq 0 ]; then
        local symbol="$color_success $ $color_reset"
    else
        local symbol="$color_failure $ $color_reset"
    fi
    
    PS1="$cwd$symbol"
}

__make_ps1
unset __make_ps1
