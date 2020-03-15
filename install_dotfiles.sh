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
command -v i3  >/dev/null 2>&1 || { echo >&2 "WARNING: i3-wm is not installed."; }
command -v vim >/dev/null 2>&1 || { echo >&2 "Vim is not installed.  Aborting."; exit 1; }

if ! [ -e ~/.vim/bundle/Vundle.vim ]; then
  echo "Installing Vundle plugin manager..."
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
echo "Vundle: OK"

if ! [ -d  ~/.vim/undodir ]; then
  echo "Creating ~/.vim/undodir directory..."
  mkdir ~/.vim/undodir 
fi
echo "Undodir: OK"

if ! [ -d  ~/.vim/custom_snippets ]; then
  echo "Creating ~/.vim/custom_snippets directory..."
  mkdir ~/.vim/custom_snippets 
fi
echo "Snippets: OK"

if ! [ -d  ~/.config/regolith/i3 ]; then
  echo "Creating ~/.i3 directory..."
  mkdir -p ~/.config/regolith/i3
fi
echo "i3-wm: OK"

# Dotfiles installation
cp -r custom_snippets/ ~/.vim/
cat config.vim      > ~/.vimrc
cat config.i3       > ~/.config/regolith/i3/config
cat config.zsh      > ~/.zshrc

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
