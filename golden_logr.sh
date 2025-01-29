#!/bin/bash
echo 'name="User Name: "' >> ~/.zshrc
echo 'RPROMPT="[%D{%f/%m}|%D{%L:%M}]"' >> ~/.zshrc
echo 'test "$(ps -ocommand= -p $PPID | awk '\''{print $1}'\'')" == '\''script'\'' || (script -a -f $HOME/log/$(date +"%F")_shell.log' >> ~/.zshrc)
echo $name >> ~/.zshrc

echo 'name="User Name: "' >> ~/.bashrc
echo 'RPROMPT="[%D{%f/%m}|%D{%L:%M}]"' >> ~/.bashrc
echo 'test "$(ps -ocommand= -p $PPID | awk '\''{print $1}'\'')" == '\''script'\'' || (script -a -f $HOME/log/$(date +"%F")_shell.log' >> ~/.bashrc)
echo $name >> ~/.bashrc
