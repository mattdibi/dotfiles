#! /bin/bash

# Variables
full_install=false

# Usage info
show_help() {
cat << EOF
Usage: ${0##*/} [-hf] ...
Dotfile installation script. It installs the dotfile
inside this repository.

    -h          display this help and exit.
    -f          FULL install: it trigger vim plugin
                installation/update through Vundle.
EOF
}

# Option parsing
while getopts ":fh" opt; do
  case $opt in
    f)
      full_install=true
      ;;
    h)
      show_help
      exit 0
      ;;
    *)
      show_help >&2
      exit 1
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      ;;
  esac
done

# Checking requirements
command -v git >/dev/null 2>&1 || { echo >&2 "I require git but it's not installed.  Aborting."; exit 1; }

command -v vim      >/dev/null 2>&1 || { echo >&2 "Vim is not installed.  Aborting."; exit 1; }
command -v tmux     >/dev/null 2>&1 || { echo >&2 "WARNING: tmux is not installed."; }
command -v i3       >/dev/null 2>&1 || { echo >&2 "WARNING: i3-wm is not installed."; }
command -v i3status >/dev/null 2>&1 || { echo >&2 "WARNING: i3status is not installed."; }

if ! [ -e ~/.vim/bundle/Vundle.vim ]; then
  echo "Installing Vundle plugin manager..."
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
cat config.zsh      > ~/.zshrc
cp minisnip/* ~/.vim/minisnip/

# Full install management
if [ "$full_install" = true ] ; then
    echo "Plugin update..."
    vim +PluginUpdate +qall
else
    echo "Run ':PluginUpdate' inside vim to complete setup."
fi

echo ""
echo "Installation complete!"
# End of file
