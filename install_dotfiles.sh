#! /bin/bash

# Variables
full_install=false
target="all"

# Usage info
show_help() {
cat << EOF
Usage: ${0##*/} [-t target] [-hf] ...
Dotfile installation script. It installs the dotfile
inside this repository.

    -h          display this help and exit.
    -t          TARGET: selects which application to
                update. Possibile targets:
                    - "all" (default)
                    - "i3"
                    - "zsh"
                    - "vim"
    -f          FULL install: it trigger vim plugin
                installation/update through Vundle.
EOF
}

# Option parsing
while getopts ":t:fh" opt; do
  case $opt in
    f)
      full_install=true
      ;;
    h)
      show_help
      exit 0
      ;;
    t)
      target=${OPTARG}
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

if ! [[ "$target" = "all" || "$target" = "i3" || "$target" = "zsh" || "$target" = "vim" ]]; then
    echo "Uknown target \"$target\". Abort."
    exit 1
fi

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
if [[ "$target" = "vim" ||  "$target" = "all" ]]; then
    echo "Installing ~/.vimrc"
    cat config.vim      > ~/.vimrc
    echo "Installing custom snippets"
    cp -r custom_snippets/ ~/.vim/
fi

if [[ "$target" = "i3" ||  "$target" = "all" ]]; then
    echo "Installing ~/.config/regolith/i3/config"
    cat config.i3       > ~/.config/regolith/i3/config
fi

if [[ "$target" = "zsh" ||  "$target" = "all" ]]; then
    echo "Installing ~/.zshrc"
    cat config.zsh      > ~/.zshrc
fi

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
