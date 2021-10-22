# Mattdibi's dotfiles
These are my configuration files. I need to add it to version tracking because I'm probably going to modify them a lot.


## Programs
- Neovim:  [https://neovim.io/](https://neovim.io/)
- i3-wm: [https://i3wm.org/](https://i3wm.org/)
- regolith-desktop: [https://regolith-linux.org/](config/regolith/i3/config) ([Installation tutorial.](https://www.omgubuntu.co.uk/2019/06/install-regolith-linux-i3-gaps-ubuntu))

**Note: Regolith-desktop installation**
```sh
$ sudo add-apt-repository ppa:kgilmer/regolith-stable
$ sudo apt install regolith-desktop
```

## Installation
Install neovim nightly (tested working with NVIM v0.5.0-756-g288f7f855):

```sh
$ curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim.appimage
$ chmod u+x nvim.appimage
$ mv nvim.appimage /usr/bin/nvim
```

Enable Python support in Neovim
```sh
$ pip3 install --user --upgrade neovim
```

Simply type these commands on a terminal window:

```sh
$ git clone https://github.com/mattdibi/dotfiles.git
$ cd dotfiles/
$ sh install_dotfiles.sh
```

### Plugin management

#### Vim-Plug manual installation
```sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
```

### Yabai installation

```sh
$ ln -s "yabai/yabairc" "${HOME}/.yabairc"
$ ln -s "yabai/skhdrc" "${HOME}/.skhdrc"
```

Workspace switch is handled [by Mission Control shortcut](https://apple.stackexchange.com/questions/213549/keyboard-shortcuts-for-switching-spaces).

### Troubleshooting

#### Flickering apps

- Issue: [Graphical issues after update](https://github.com/regolith-linux/regolith-desktop/issues/116)
- Other informations: [Regolith Compositors](https://regolith-linux.org/docs/customize/compositors/)
- Solution: **Disable compton**
