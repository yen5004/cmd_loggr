# Used to install tmux logging script

#tmux plug in for scripting

# Create .tmux file if none exisit
cd ~
if [ ! -d ".tmux" ]; then
  echo ".tmux folder not found. Creating..."
  sudo mkdir ".tmux" && sudo chmod 777 ".tmux"
  echo ".tmux folder created successfully. - $(get_timestamp)" | tee -a $logg
else  
  echo ".tmux folder already exists" | tee -a $logg
fi

sudo cp $git_folder/tpm ~/.tmux/plugins/tpm
echo 'set -g @plugin "tmux-plugins/tmux-logging' >> ~/.tmux.conf
tmux source ~/.tmux.conf
~/.tumux/plugins/tpm/scripts/install_plugins.sh
echo "Tmux-logging plugin installed - $(get_timestamp)" | tee -a $logg
