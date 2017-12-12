if ! [ -d  ~/.vim/colors ]; then
  mkdir ~/.vim/colors 
fi

if ! [ -d  ~/.vim/minisnip ]; then
  mkdir ~/.vim/minisnip 
fi

cat space-vim-dark.vim > ~/.vim/colors/space-vim-dark.vim

cat config.vim > ~/.vimrc
cat config.tmux > ~/.tmux.conf

cp minisnip/* ~/.vim/minisnip/

echo "Installed config file. Enjoy =D"
