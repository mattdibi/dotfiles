if ! [ -e ~/.vim/bundle/Vundle.vim ]; then
  echo "Installing Vundle plugin manager.."
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

cat config.vim > ~/.vimrc
cat config.tmux > ~/.tmux.conf
cat config.i3 > ~/.i3/config
cat config.i3status > ~/.i3status.conf
cat config.bash > ~/.bashrc

cp minisnip/* ~/.vim/minisnip/

echo "Installation complete. Enjoy =D"
