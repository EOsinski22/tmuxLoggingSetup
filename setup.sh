#!/bin/bash

# BASH error handling:
#   exit on command failure
set -e
#   keep track of the last executed command
trap 'LAST_COMMAND=$CURRENT_COMMAND; CURRENT_COMMAND=$BASH_COMMAND' DEBUG
#   on error: print the failed command
trap 'ERROR_CODE=$?; FAILED_COMMAND=$LAST_COMMAND; tput setaf 1; echo "ERROR: command \"$FAILED_COMMAND\" failed with exit code $ERROR_CODE"; put sgr0;' ERR INT TERM

FILE=$HOME/.tmux/plugins/tmux-logging/scripts/variables.sh
if [ -f "$FILE" ]; then
    echo -e "$FILE exists."
else
    echo -e "[[ERROR]]\n$FILE does not exist.\n\nMake sure you've run the step1 script AND sourced the tmux plugins by pressing ('Prefix_key + I') from within a Tmux session\n"
fi

sed -i 's/M-p/k/g' $HOME/.tmux/plugins/tmux-logging/scripts/variables.sh
sed -i 's/M-P/l/g' $HOME/.tmux/plugins/tmux-logging/scripts/variables.sh
sed -i 's/M-c/L/g' $HOME/.tmux/plugins/tmux-logging/scripts/variables.sh
sed -i 's/HOME/HOME\/tmuxlogs/g' $HOME/.tmux/plugins/tmux-logging/scripts/variables.sh
sed -i 's/%Y%m%dT%H%M%S/%Y%m%d--%H-%M-%S/g' $HOME/.tmux/plugins/tmux-logging/scripts/variables.sh
echo -e "\nSetup Complete!\n\nLast Step. In a Tmux Session press: 'Prefix_key + I'\n\nCongrats. Now press 'Prefix_key + l' to capture full pane history to ~/tmuxlogs/"
