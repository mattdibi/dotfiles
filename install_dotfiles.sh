if ! [ -d  ~/.vim/colors ]; then
  echo "Creating ~/.vim/colors directory..."
  mkdir ~/.vim/colors 
fi

if ! [ -d  ~/.vim/minisnip ]; then
  echo "Creating ~/.vim/minisnip directory..."
  mkdir ~/.vim/minisnip 
fi

if ! [ -d  ~/.i3 ]; then
  echo "Creating ~/.i3 directory..."
  mkdir ~/.i3
fi

cat config.vim > ~/.vimrc
cat config.tmux > ~/.tmux.conf
cat config.i3 > ~/.i3/config
cat config.i3status > ~/.i3status.conf
cat config.bash > ~/.bashrc

cp minisnip/* ~/.vim/minisnip/

echo "Installed config file. Enjoy =D"
