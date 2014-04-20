# Set $DEFAULT_USER
if [[ -z "$SSH_CLIENT" ]]; then
  export DEFAULT_USER="$USER"
fi
