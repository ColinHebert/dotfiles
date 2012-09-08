# ------------------------------------------------------------------------------
# Compile the completion dump to increase startup speed
# ------------------------------------------------------------------------------
{
  zcompdump="$HOME/.zcompdump"
  if [[ "$dump_file" -nt "${zcompdump}.zwc" || ! -s "${zcompdump}.zwc" ]]; then
    zcompile "$zcompdump"
  fi
  unset zcompdump
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
