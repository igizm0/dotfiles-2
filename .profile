#!/usr/bin/env bash

export LANG=ru_RU.UTF-8
export LC_ALL=RU_RU.UTF-8
set meta-flag on
set input-meta on
set output-meta on
set convert-meta off

# Add tab completion for SSH hostnames based on ~/.ssh/config, ignoring wildcards
[ -e "$HOME/.ssh/config" ] && complete -o "default" -o "nospace" -W "$(grep "^Host" ~/.ssh/config | grep -v "[?*]" | cut -d " " -f2 | tr ' ' '\n')" scp sftp ssh

export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

load_dotfiles() {
    declare -a files=(
        $HOME/.aliases # Aliases
        $HOME/.exports # Exports
        $HOME/.functions # Functions
        $(brew --prefix)/etc/bash_completion # Bash completion (installed via Homebrew)
    )

    # if these files are readable, source them
    for index in ${!files[*]}
    do
        if [[ -r ${files[$index]} ]]; then
            source ${files[$index]}
        fi
    done
}

load_dotfiles
unset load_dotfiles

