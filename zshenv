# ------------------------------------------------------------------------------
# PATH
# ------------------------------------------------------------------------------
typeset -U PATH MANPATH # Do not allow duplicate entries.
export PATH=$HOME/.local/bin:$HOME/.local/sbin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin
for f in /etc/paths.d/*; do path+=($(<$f)); done
export MANPATH=$HOME/.local/share/man:/usr/local/share/man:/usr/share/man
for f in /etc/manpaths.d/*; do manpath+=($(<$f)); done

# ------------------------------------------------------------------------------
# Editors
# ------------------------------------------------------------------------------
export EDITOR="emacsclient -nw -a ''"
export VISUAL=$EDITOR
export PAGER="less"

# ------------------------------------------------------------------------------
# Less
# ------------------------------------------------------------------------------
export LESSCHARSET="UTF-8"
export LESSHISTFILE='-'
export LESSEDIT='%E ?lm+%lm. %f'
export LESS='-c -F -i -M -R -S -w -X -z-4'
[[ -x "${commands[lesspipe.sh]}" ]] && \
    export LESSOPEN='|/usr/local/bin/lesspipe.sh %s'

# ------------------------------------------------------------------------------
# Termcap Colours
# ------------------------------------------------------------------------------
[[ "$TERM" != 'dumb' ]] && {
  export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
  export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
  export LESS_TERMCAP_me=$'\E[0m'           # end mode
  export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
  export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
  export LESS_TERMCAP_ue=$'\E[0m'           # end underline
  export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline
}

