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

# Dotfiles installation
if [[ "$target" = "vim" ||  "$target" = "all" ]]; then
    echo "Installing ~/.config/nvim"
    ln -s $("pwd")/nvim ~/.config/nvim/
fi

if [[ "$target" = "i3" ||  "$target" = "all" ]]; then
    echo "Installing ~/.config/regolith/i3/config"
    ln -s $("pwd")/i3 ~/.config/regolith/i3/
fi

if [[ "$target" = "zsh" ||  "$target" = "all" ]]; then
    echo "Installing ~/.zshrc"
    ln -s $("pwd")/zsh/zhsrc ~/.zshrc
fi

echo ""
echo "Installation complete!"
# End of file
