# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Do not do character class list expansion
unsetopt BRACE_CCL

# Do completion, trusting /usr/local (brew)
compinit -u
