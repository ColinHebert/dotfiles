# ------------------------------------------------------------------------------
# Path
# ------------------------------------------------------------------------------
path=(
  $HOME/.local/{bin,sbin}
  $HOME/.local/opt/{bin,sbin}
  $(brew --prefix coreutils)/libexec/gnubin
  /usr/local/{bin,sbin}
  $path
)

infopath=(
  $HOME/.local/share/info
  $HOME/.local/opt/share/info
  $infopath
)

manpath=(
  $HOME/.local/share/man
  $HOME/.local/opt/share/man
  $manpath
)

# ------------------------------------------------------------------------------
# Editors
# ------------------------------------------------------------------------------
export EDITOR="emacsclient -t -a ''"
export VISUAL=$EDITOR
export PAGER="less"

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

# ------------------------------------------------------------------------------
# Aliases
# ------------------------------------------------------------------------------
alias l='ls -la'

# ------------------------------------------------------------------------------
# Performances tests
# ------------------------------------------------------------------------------
#zprof
