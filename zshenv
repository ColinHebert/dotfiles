# ------------------------------------------------------------------------------
# Path to Oh My Zsh
# ------------------------------------------------------------------------------
export OMZ="$HOME/.oh-my-zsh"

# ------------------------------------------------------------------------------
# Paths
# ------------------------------------------------------------------------------
typeset -gU cdpath fpath mailpath manpath path
typeset -gUT INFOPATH infopath

cdpath=(
  $HOME
  $cdpath
)

infopath=(
  $HOME/.local/share/info
  $HOME/.local/opt/share/info
  /usr/local/share/info
  /usr/share/info
  $infopath
)

manpath=(
  $HOME/.local/share/man
  $HOME/.local/opt/share/man
  /usr/local/share/man
  /usr/share/man
  $manpath
)

for path_file in /etc/manpaths.d/*(.N); do
  manpath+=($(<$path_file))
done
unset path_file

path=(
  $HOME/.local/{bin,sbin}
  $HOME/.local/opt/{bin,sbin}
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
)

for path_file in /etc/paths.d/*(.N); do
  path+=($(<$path_file))
done
unset path_file

# ------------------------------------------------------------------------------
# Locale
# ------------------------------------------------------------------------------
if [[ -z "$LANG" ]]; then
  eval "$(locale)"
fi

# ------------------------------------------------------------------------------
# Editors
# ------------------------------------------------------------------------------
export EDITOR="emacsclient -t -a ''"
export VISUAL=$EDITOR
export PAGER="less"

# Browser (Default)
if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

# ------------------------------------------------------------------------------
# Less
# ------------------------------------------------------------------------------
export LESSEDIT='%E ?lm+%lm. %f'
export LESS='-c -F -i -M -R -S -w -X -z-4'

# ------------------------------------------------------------------------------
# Termcap Colours
# ------------------------------------------------------------------------------
if zstyle -t ':omz:environment:termcap' color; then
  export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
  export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
  export LESS_TERMCAP_me=$'\E[0m'           # end mode
  export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
  export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
  export LESS_TERMCAP_ue=$'\E[0m'           # end underline
  export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
fi

if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
alias l='ls -la'
