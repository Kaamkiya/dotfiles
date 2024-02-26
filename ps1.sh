__make_ps1() {
    local color_reset="\[\033[m\]"
    local color_success="\[\033[0;32m\]" # green
    local color_failure="\[\033[0;31m\]" # red

    local cwd_color="\[\033[0;34m\]" # blue
    local cwd="$cwd_color\w/$color_reset"

    local git_color="\033[0;33m" # yellow

    if [[ $? == 0 ]]; then
        local symbol="$color_success $ $color_reset"
    else
        local symbol="$color_failure $ $color_reset"
    fi

    __git_info() {
        local git_branch_symbol="⑂"
        local git_eng="env LANG=C git" # git in English, just to make my life easier
        
        hash git 2>/dev/null || echo -n # if git is not installed, return

        local branch=$($git_eng symbolic-ref --short HEAD 2>/dev/null)
        
        if [[ -n $branch ]]; then
            echo -n " $git_color$git_branch_symbol$branch$color_reset"
        else
            echo -n # if not in a git repo, return
        fi
    }
    
    local git='$(__git_info)'
    PS1="$cwd$git$symbol"
}

__make_ps1
unset __make_ps1
