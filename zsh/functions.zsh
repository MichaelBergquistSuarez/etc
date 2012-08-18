# functions.zsh: Custom functions, and function invocations.
# P.C. Shyamshankar <sykora@lucentbeing.com>

if (( C == 256 )); then
    autoload spectrum && spectrum # Set up 256 color support.
fi

# Simple function to get the current git branch.
function git_current_branch() {
    ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    print "${ref#refs/heads/}"
}

case $TERM in
    *xterm*|*rxvt*|*screen*)
        # Special function precmd, executed before displaying each prompt.
        function precmd() {
            # Set the terminal title to the current working directory.
            print -Pn "\e]0;%n@%m:%~\a"

            # Get the current git branch into the prompt.
            git_branch=""
            current_branch=$(git_current_branch)

            if [[ ${current_branch} != "" ]]; then
                if (( C == 256 )); then
                    git_status=$(git status --porcelain)
                    if [[ $git_status == "" ]]; then
                        branch_color=222
                    elif (( $(echo $git_status | grep -c "^.M\|??") > 0 )); then
                        branch_color=160
                    else
                        branch_color=082
                    fi

                    git_branch=":%{$FX[reset]$FG[${branch_color}]%}${current_branch}"
                else
                    git_branch=":${current_branch}"
                fi
            fi
        }

        # Special function preexec, executed before running each command.
        function preexec () {
            print -Pn "\e]2;[${2:q}]\a"
        }
esac

# Autoload some useful utilities.
autoload -Uz zmv
autoload -Uz zargs
