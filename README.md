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

### Troubleshooting

#### Flickering apps

- Issue: [Graphical issues after update](https://github.com/regolith-linux/regolith-desktop/issues/116)
- Other informations: [Regolith Compositors](https://regolith-linux.org/docs/customize/compositors/)
- Solution: **Disable compton**
