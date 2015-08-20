# EXPORT
export LANG=ru
export LC_ALL=ru_RU.UTF-8
export LANG=ru_RU.UTF-8
export EDITOR="nano"
export HISTSIZE=2000
export SAVEHIST=2000
export HISTFILE="$HOME/.zsh_history"
export PATH=$HOME/bin:/usr/local/bin:$PATH

DEFAULT_USER="pavel"

autoload -U colors && colors
autoload -U compinit && compinit

source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/local/opt/zsh-history-substring-search/zsh-history-substring-search.zsh
fpath=(/usr/local/share/zsh-completions $fpath)
setopt menu_complete

cdpath=(/Users/pavel)
setopt AUTO_CD
setopt CORRECT
setopt PUSHD_TO_HOME
setopt NUMERIC_GLOB_SORT
setopt GLOB_COMPLETE

# HISTORY
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

source ~/.zsh/autocomplete.zsh
source ~/.zsh/aliases.zsh
source ~/.zsh/functions.zsh
source ~/.zsh/highlighting.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/prompt.zsh
