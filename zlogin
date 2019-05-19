# ------------------------------------------------------------------------------
# Compile the completion dump to increase startup speed
# ------------------------------------------------------------------------------
{
  # Compile the completion dump to increase startup speed.
  zcompdump="${ZDOTDIR:-$HOME}/.zcompdump"
  if [[ -s "$zcompdump" && (! -s "${zcompdump}.zwc" || "$zcompdump" -nt "${zcompdump}.zwc") ]]; then
    zcompile "$zcompdump"
  fi
} &!

# ------------------------------------------------------------------------------
# Set environment variables for launchd processes
# ------------------------------------------------------------------------------
{
if [[ "$OSTYPE" == darwin* ]]; then
  for env_var in PATH MANPATH; do
    launchctl setenv "$env_var" "${(P)env_var}" &!
  done
  unset env_var
fi
} &!
