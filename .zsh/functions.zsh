# auto ls after cd
function chpwd() {
    emulate -L zsh
    ls -a
}

function pfd() {
  osascript 2>/dev/null <<EOF
    tell application "Finder"
      return POSIX path of (target of window 1 as alias)
    end tell
EOF
}

function pfs() {
  osascript 2>/dev/null <<EOF
    set output to ""
    tell application "Finder" to set the_selection to selection
    set item_count to count the_selection
    repeat with item_index from 1 to count the_selection
      if item_index is less than item_count then set the_delimiter to "\n"
      if item_index is item_count then set the_delimiter to ""
      set output to output & ((item item_index of the_selection as alias)'s POSIX path) & the_delimiter
    end repeat
EOF
}

function cdf() {
  cd "$(pfd)"
}

function zsh_reload()
{
  local cache=$ZSH_CACHE_DIR
  autoload -U compinit zrecompile
  compinit -d "$cache/zcomp-$HOST"

  for f in ~/.zshrc "$cache/zcomp-$HOST"; do
    zrecompile -p $f && command rm -f $f.zwc.old
  done

  source ~/.zshrc
}

# Select the current directory in LaunchBar, optionally a file
function lb() {
  if [[ $# = 1 ]]; then
    [[ -e "$(pwd)/$1" ]] && open "x-launchbar:select?file=$(pwd)/$1" || open "x-launchbar:select?file=$1"
  else
    open "x-launchbar:select?file=$(pwd)"
  fi
}