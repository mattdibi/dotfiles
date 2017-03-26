if ! [ -d  ~/.vim/colors ]; then
  mkdir ~/.vim/colors 
fi

cat space-vim-dark.vim > ~/.vim/colors/space-vim-dark.vim

cat config.vim > ~/.vimrc
echo "Installed vimrc config file. Enjoy =D"
