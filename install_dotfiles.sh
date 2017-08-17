if ! [ -d  ~/.vim/colors ]; then
  mkdir ~/.vim/colors 
fi

cat space-vim-dark.vim > ~/.vim/colors/space-vim-dark.vim

cat config.vim > ~/.vimrc
cat config.tmux > ~/.tmux.conf
cat config.rofi > ~/.Xresources
echo "Installed config file. Enjoy =D"
