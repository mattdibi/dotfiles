# Checking requirements
command -v git >/dev/null 2>&1 || { echo >&2 "I require git but it's not installed.  Aborting."; exit 1; }

command -v vim      >/dev/null 2>&1 || { echo >&2 "Vim is not installed.  Aborting."; exit 1; }
command -v tmux     >/dev/null 2>&1 || { echo >&2 "WARNING: tmux is not installed."; }
command -v i3       >/dev/null 2>&1 || { echo >&2 "WARNING: i3-wm is not installed."; }
command -v i3status >/dev/null 2>&1 || { echo >&2 "WARNING: i3status is not installed."; }

if ! [ -e ~/.vim/bundle/Vundle.vim ]; then
  echo "Installing Vundle plugin manager.."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
echo "Vundle: OK"

if ! [ -d  ~/.vim/minisnip ]; then
  echo "Creating ~/.vim/minisnip directory..."
  mkdir ~/.vim/minisnip 
fi
echo "Minisnip: OK"

if ! [ -d  ~/.i3 ]; then
  echo "Creating ~/.i3 directory..."
  mkdir ~/.i3
fi
echo "i3-wm: OK"

# Dotfiles installation
cat config.vim      > ~/.vimrc
cat config.tmux     > ~/.tmux.conf
cat config.i3       > ~/.i3/config
cat config.i3status > ~/.i3status.conf
cat config.bash     > ~/.bashrc

cp minisnip/* ~/.vim/minisnip/

echo ""
echo "Installation complete!"
echo "Run ':PluginUpdate' inside vim to complete setup."
