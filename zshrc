#
# Sets Oh My Zsh options.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Colin Hebert <hebert.colin@gmail.com>
#

# Set the key mapping style to 'emacs' or 'vi'.
zstyle ':omz:module:editor' keymap 'emacs'

# Auto convert .... to ../..
zstyle ':omz:module:editor' dot-expansion 'no'

# Set case-sensitivity for completion, history lookup, etc.
zstyle ':omz:*:*' case-sensitive 'no'

# Color output (auto set to 'no' on dumb terminals).
zstyle ':omz:*:*' color 'yes'

# Auto set the tab and window titles.
zstyle ':omz:module:terminal' auto-title 'yes'

# Set the Oh My Zsh modules to load (browse modules).
zstyle ':omz:load' omodule \
  'tmux' 'gnu-utility' \
  'environment' 'terminal' 'editor' 'completion' 'history' 'directory' \
  'alias' 'prompt' \
  'archive' 'git' 'history-substring-search' 'syntax-highlighting'

# Auto launch GNU Screen at start-up.
zstyle ':omz:module:tmux' auto-start 'yes'

# Set the prompt theme to load.
# Setting it to 'random' loads a random theme.
# Auto set to 'off' on dumb terminals.
zstyle ':omz:module:prompt' theme 'makkhdyn'

# This will make you shout: OH MY ZSHELL!
source "$OMZ/init.zsh"
