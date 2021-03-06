#! /bin/bash

# Variables
target="all"

# Usage info
show_help() {
cat << EOF
Usage: ${0##*/} [-t target] [-h] ...
Dotfile installation script. It installs the dotfile
inside this repository.

    -h          display this help and exit.
    -t          TARGET: selects which application to
                update. Possibile targets:
                    - "all" (default)
                    - "i3"
                    - "zsh"
                    - "vim"
EOF
}

# Option parsing
while getopts ":t:h" opt; do
  case $opt in
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

# Checking accepted targets
if ! [[ "$target" = "all" || "$target" = "i3" || "$target" = "zsh" || "$target" = "vim" ]]; then
    echo "Uknown target \"$target\". Abort."
    exit 1
fi

# Checking requirements
command -v git >/dev/null 2>&1 || { echo >&2 "I require git but it's not installed.  Aborting."; exit 1; }
command -v i3  >/dev/null 2>&1 || { echo >&2 "WARNING: i3-wm is not installed."; }
command -v vim >/dev/null 2>&1 || { echo >&2 "Vim is not installed.  Aborting."; exit 1; }

if ! [ -d  ~/.config/nvim/undodir ]; then
  echo "Creating ~/.config/nvim/undodir directory..."
  mkdir ~/.config/nvim/undodir
fi
echo "Undodir: OK"

if ! [ -d  ~/.config/regolith/i3 ]; then
  echo "Creating ~/.i3 directory..."
  mkdir -p ~/.config/regolith/i3
fi
echo "i3-wm: OK"

# Dotfiles installation
if [[ "$target" = "vim" ||  "$target" = "all" ]]; then
    echo "Installing ~/.config/nvim/init.vim"
    mkdir -p ~/.config/nvim/
    ln -s $("pwd")/config.vim ~/.config/nvim/init.vim
    echo "Installing custom snippets"
    ln -s $("pwd")/custom_snippets/ ~/.config/nvim/
fi

if [[ "$target" = "i3" ||  "$target" = "all" ]]; then
    echo "Installing ~/.config/regolith/i3/config"
    cat config.i3       > ~/.config/regolith/i3/config
fi

if [[ "$target" = "zsh" ||  "$target" = "all" ]]; then
    echo "Installing ~/.zshrc"
    cat config.zsh      > ~/.zshrc
fi

echo ""
echo "Installation complete!"
# End of file
