#!/bin/bash

# BASH error handling:
#   exit on command failure
set -e
#   keep track of the last executed command
trap 'LAST_COMMAND=$CURRENT_COMMAND; CURRENT_COMMAND=$BASH_COMMAND' DEBUG
#   on error: print the failed command
trap 'ERROR_CODE=$?; FAILED_COMMAND=$LAST_COMMAND; tput setaf 1; echo "ERROR: command \"$FAILED_COMMAND\" failed with exit code $ERROR_CODE"; put sgr0;' ERR INT TERM

# Get tpm
echo "Downloading tpm to ~/.tmux/plugins/tpm"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Create the conf file
echo "Creating ~/.tmux.conf file"
cat > ~/.tmux.conf << EOF
# increase history size (Be careful making this too large)
set -g history-limit 15000

# List of plugins
# to enable a plugin, use the 'set -g @plugin' syntax:
set -g @plugin 'tmux-plugins/tpm'
set -g @plugin 'tmux-plugins/tmux-sensible'
set -g @plugin 'tmux-plugins/tmux-logging'

# Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
run '~/.tmux/plugins/tpm/tpm'
EOF

# Create logging directory
echo "Creating directory for logs at ~/tmuxlogs"
mkdir ~/tmuxlogs

# Next steps
echo -e  "\n!!IMPORTANT NEXT STEP!!"
echo "Open a new Tmux session and fetch and source our new plugins." 
echo -e "\ntmux new -s abc"
echo "prefix_key + I"
