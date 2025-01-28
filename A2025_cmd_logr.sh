#!/bin/bash

# Ensure the ~/log directory exists, create it if it doesn't
mkdir -p ~/log

# Function to add common content to both .bashrc and .zshrc
update_shell_config() {
    local config_file=$1
    local name=$2

    echo "###########_Custom Script Below_###########" >> "$config_file"
    echo "# Script created by Franco M." >> "$config_file"
    echo "###########_Custom Script Below_###########" >> "$config_file"
    echo "export NAME=$name" >> "$config_file"
    echo 'RPROMPT="[%D{%d%b%Y}|%D{%L:%M}]"' >> "$config_file"

    # Add debug logging to see where it gets stuck
    echo 'if [[ ! -f $HOME/.script_running ]]; then' >> "$config_file"
#    echo '    touch $HOME/.script_running' >> "$config_file"
    echo '    /usr/bin/script -a -f $HOME/log/$(date +"%F")_shell.log >/dev/null 2>&1' >> "$config_file"  # Silence the message
#    echo '    rm -f $HOME/.script_running' >> "$config_file"
    echo 'fi' >> "$config_file"
    echo 'echo "Finished script section"' >> "$config_file"

    echo "echo User Name: '$name'" >> "$config_file"
    echo "ip addr" >> "$config_file"
    echo 'note="use exit to close script"' >> "$config_file"
    echo 'echo $note' >> "$config_file"
}

# Prompt username and store it
echo "Please enter your username"
read -r name

# Update both .bashrc and .zshrc with the custom configuration
update_shell_config ~/.bashrc "$name"
update_shell_config ~/.zshrc "$name"

# Notify user that the script has finished
echo "Command logger install complete"
echo "cmd_logr_install.sh finished!"
