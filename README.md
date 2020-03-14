# Mattdibi's dotfiles
These are my configuration files. I need to add it to version tracking because I'm probably going to modify them a lot.


## Programs
- Vim:  [https://github.com/vim](https://github.com/vim)
- i3-wm: [https://i3wm.org/](https://i3wm.org/)
- regolith-desktop: [https://regolith.com/](https://www.omgubuntu.co.uk/2019/06/install-regolith-linux-i3-gaps-ubuntu)

**Note: clipboard support** You need to install **vim-gnome** or **vim-gtk**, depending on your system configuration, to be able to effectively copy and paste from the system clipboard. The clipboard registers are `+` and `*`  

**Note: Regolith-desktop installation**
```sh
$ sudo add-apt-repository ppa:kgilmer/regolith-stable
$ sudo apt install regolith-desktop
```

## Installation
Simply type these commands on a terminal window:

```sh
$ git clone https://github.com/mattdibi/dotfiles.git
$ cd dotfiles/
$ sh install_dotfiles.sh
```

Then for the i3 customizations:

```sh
$ mkdir ~/.config/regolith/i3
$ cp config.i3 ~/.config/regolith/i3/
```

### Plugin management

#### Vundle manual installation
```sh
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
```
