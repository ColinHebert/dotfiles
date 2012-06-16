# ------------------------------------------------------------------------------
# Compile the completion dump to increase startup speed
# ------------------------------------------------------------------------------
{
dump_file="$HOME/.zcompdump"
if [[ "$dump_file" -nt "${dump_file}.zwc" || ! -s "${dump_file}.zwc" ]]; then
  zcompile "$dump_file"
fi
unset dump_file
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
