# ------------------------------------------------------------------------------
# Paths
# ------------------------------------------------------------------------------
# Ignore global zshrc and zprofile files
unsetopt GLOBAL_RCS

typeset -gU cdpath fpath mailpath manpath path
typeset -gUT INFOPATH infopath

#cdpath=(
#  $HOME
#  $cdpath
#)

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
  /usr/local/opt/coreutils/libexec/gnubin
  /usr/local/{bin,sbin}
  /usr/{bin,sbin}
  /{bin,sbin}
  $path
)

for path_file in /etc/paths.d/*(.N); do
  path+=($(<$path_file))
done
unset path_file

# Temporary files
if [[ -d "$TMPDIR" ]]; then
  export TMPPREFIX="${TMPDIR%/}/zsh"
  if [[ ! -d "$TMPPREFIX" ]]; then
    mkdir -p "$TMPPREFIX"
  fi
fi

# ------------------------------------------------------------------------------
# Locale
# ------------------------------------------------------------------------------
if [[ -z "$LANG" ]]; then
  eval "$(locale)"
fi

# ------------------------------------------------------------------------------
# Editors
# ------------------------------------------------------------------------------
export EDITOR="code -w"
export VISUAL="$EDITOR"
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

if (( $+commands[lesspipe.sh] )); then
  export LESSOPEN='| /usr/bin/env lesspipe.sh %s 2>&-'
fi
