#! /bin/bash

# Dotfiles installation
echo "Installig ~/.vimrc"
cat config.vim      > ~/.vimrc
echo "Installig custom snippets"
cp -r custom_snippets/ ~/.vim/

echo ""
echo "Installation complete!"
# End of file
