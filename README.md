# Mattdibi's dotfiles
These are my configuration files. I need to add it to version tracking because I'm probably going to modify them a lot.


## Programs
- Vim:  [https://github.com/vim](https://github.com/vim)
- Tmux: [https://github.com/tmux/tmux](https://github.com/tmux/tmux)
- i3-wm: [https://i3wm.org/](https://i3wm.org/)

**Note:** You need to install **vim-gnome** or **vim-gtk**, depending on your system configuration, to be able to effectively
copy and paste from the system clipboard.
The clipboard registers are " and *  
Examples:
- `"+p` => pastes from system clipboard
- `"+yw` => yanks word in + register and can be pasted in another window

**Note: i3 installation**
```sh
sudo apt-get install i3-wm i3status dmenu rofi gksu feh numlockx xautolock
gsettings set org.gnome.desktop.background show-desktop-icons false
```

or use

```sh
sudo apt-get install i3
```
Run the second command to disable drawing of the desktop by Nautilus.

## Installation
Simply type these commands on a terminal window:

```sh
$ git clone https://github.com/mattdibi/dotfiles.git
$ cd dotfiles/
$ sh install_dotfiles.sh
```

### Plugin management

#### Vundle manual installation
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
