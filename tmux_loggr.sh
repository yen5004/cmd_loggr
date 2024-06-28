# Used to install tmux Plugin Manager, Script logger, and any other tmux plugins

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

if [ ! -d ".tmux/plugins/tpm/tpm" ]; then
  echo ".tmux/plugins/tpm/tpm folder not found. Creating..."
  sudo mkdir ".tmux/plugins/tpm/tpm" && sudo chmod 777 -R ".tmux/plugins/tpm/tpm"
  echo ".tmux/plugins/tpm/tpm folder created successfully."
else  
  echo ".tmux/plugins/tpm/tpm folder already exists"
fi

if [ ! -d ".tmux/plugins/tpm/scripts" ]; then
  echo ".tmux/plugins/tpm/scripts folder not found. Creating..."
  sudo mkdir ".tmux/plugins/tpm/scripts" && sudo chmod 777 -R ".tmux/plugins/tpm/scripts"
  echo ".tmux/plugins/tpm/scripts folder created successfully."
else  
  echo ".tmux/plugins/tpm/scripts folder already exists"
fi

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux_conf=~/.tmux.conf

# Place Plugins here:
plugin_lines=(
    'set -g @plugin "tmux-plugins/tpm"'
    'set -g @plugin "tmux-plugins/tmux-sensible"'
    'set -g @plugin "tmux-plugins/tmux-logging"'
    # Initialize TMUX plugin manager (keep this line at the very bottom of tmux.conf)
    'run "~/.tmux/plugins/tpm/tpm"'
)

# Check if the file already exists
if [ ! -f "$tmux_conf" ]; then
    # If file doesnt exsist, make one and loop through plugins
    sudo touch 'tmux_conf' && sudo chmod 777 '$tmux_conf'
    # Iterate over each plugin line and append it to the file
    for line in "${plugin_lines[@]}"; do
        echo "$line" >> "$tmux_conf"
    done
else
    echo "File $tmux_conf already exists. Starting append operation."
    # Iterate over each plugin line and append it to the file
    for line in "${plugin_lines[@]}"; do
        echo "$line" >> "$tmux_conf"
    done
fi

tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/scripts/install_plugins.sh
echo "Tmux-logging plugin installed"
