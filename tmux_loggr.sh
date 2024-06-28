# Used to install tmux logging script

# Create .tmux file if none exisit
cd ~
if [ ! -d ".tmux" ]; then
  echo ".tmux folder not found. Creating..."
  sudo mkdir ".tmux" && sudo chmod -R 777 ".tmux"
  echo ".tmux folder created successfully."
else  
  echo ".tmux folder already exists"
fi

if [ ! -d ".tmux/plugins" ]; then
  echo ".tmux/plugins folder not found. Creating..."
  sudo mkdir ".tmux/plugins" && sudo chmod -R 777 ".tmux/plugins"
  echo ".tmux/plugins folder created successfully."
else  
  echo ".tmux/plugins folder already exists"
fi

if [ ! -d ".tmux/plugins/tpm" ]; then
  echo ".tmux/plugins/tpm folder not found. Creating..."
  sudo mkdir ".tmux/plugins/tpm" && sudo chmod 777 -R ".tmux/plugins/tpm"
  echo ".tmux/plugins/tpm folder created successfully."
else  
  echo ".tmux/plugins/tpm folder already exists"
fi

if [ ! -d ".tmux/plugins/tpm/scripts" ]; then
  echo ".tmux/plugins/tpm/scripts folder not found. Creating..."
  sudo mkdir ".tmux/plugins/tpm/scripts" && sudo chmod 777 -R ".tmux/plugins/tpm/scripts"
  echo ".tmux/plugins/tpm/scripts folder created successfully."
else  
  echo ".tmux/plugins/tpm/scripts folder already exists"
fi

sudo cp $git_folder/tpm ~/.tmux/plugins/tpm
echo 'set -g @plugin "tmux-plugins/tmux-logging' >> ~/.tmux.conf
tmux source ~/.tmux.conf
~/.tumux/plugins/tpm/scripts/install_plugins.sh
echo "Tmux-logging plugin installed"
