#!/bin/bash

# Installs the ablility to log commands typed into the terminal

###############################
# Install command logger

cd ~
sudo mkdir log && sudo chmod 777 log && cd log
sudo touch cmd_logr_install.sh && sudo chmod 777 cmd_logr_install.sh
cat << 'EOF' > cmd_logr_install.sh
#Install logger script
echo "###########Custom Script Below###########" | tee -a ~/.zshrc
echo "Script created by Franco M." | tee -a ~/.zshrc
echo "###########Custom Script Below###########" | tee -a ~/.bashrc
echo "Script created by Franco M." | tee -a ~/.bashrc

#Prompt username
echo "Please enter your username"

#Read user input 
read -r name

#Store username in the .zshrc
echo "export NAME=$name" >> ~/.zshrc

#Display time in terminal
#echo 'RPROMPT="[%D{%m/%f/%Y}|%D{%L:%M}]"' >> ~/.zshrc
echo 'RPROMPT="[%D{%d%b%Y}|%D{%L:%M}]"' >> ~/.zshrc

#Sent logs to a file with time stamp
echo 'test "$(ps -ocommand= -p $PPID | awk '\''{print $1}'\'')" == '\''script'\'' || (script -a -f $HOME/log/$(date +"%F")_shell.log)' >> ~/.zshrc

#Confirm user is stored and display IP info and more
echo "echo TED-User: '$name'" >> ~/.zshrc
echo "ifconfig" >> ~/.zshrc
echo "NOTE: Use EXIT to close Log Script" >> ~/.zshrc
#echo "NOTE: Use EXIT to close Log Script"
echo 'echo $note' >> ~/.zshrc

#Store username in the .bashrc
echo "export NAME=$name" >> ~/.bashrc
#echo 'RPROMPT="[%D{%m/%f/%Y}|%D{%L:%M}]"' >> ~/.bashrc
echo 'RPROMPT="[%D{%d%b%Y}|%D{%L:%M}]"' >> ~/.bashrc  

#Sent logs to a file with time stamp
echo 'test "$(ps -ocommand= -p $PPID | awk '\''{print $1}'\'')" == '\''script'\'' || (script -a -f $HOME/log/$(date +"%F")_shell.log)' >> ~/.bashrc

#Confirm user is stored and display IP info and more
echo "User_Name: '$name'" >> ~/.bashrc
echo "ifconfig" >> ~/.bashrc
echo 'NOTE: Use EXIT to close Log Script' >> ~/.bashrc
echo 'echo $note' >> ~/.bashrc
echo "Command logger install complete"

EOF

echo "Copied 'cmd_logr_install.sh' at: $PWD"
./cmd_logr_install.sh
echo "Install complete for 'cmd_logr_install.sh'"
cd ~
