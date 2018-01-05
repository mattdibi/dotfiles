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
sudo apt-get install i3-wm i3status dmenu rofi
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
$ sh install_dotfiles.sh
```

### Plugin management

#### Pathogen installation
```sh
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

### General purpose

#### Vim-Minisnip installation
```sh
cd ~/.vim/bundle
https://github.com/joereynolds/vim-minisnip
```

#### Vim-Surround installation
```sh
cd ~/.vim/bundle
git clone git://github.com/tpope/vim-surround.git
```
**Use:** 
- `ysiw"` => surrounds word with `"`
- `cs"(` => change surrounding `"` to `(`
- `ds(` => delete surrounding `(`
After a selection w/ Visual mode: `S[symbol]` surrounds the selection with `[symbol]`

### Status display

#### Gitgutter installation
```sh
cd ~/.vim/bundle
git clone git://github.com/airblade/vim-gitgutter.git
```

#### Airline installation
```sh
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
```

### Project navigation

#### Tagbar installation 
```sh
git clone https://github.com/majutsushi/tagbar.git ~/.vim/bundle
```

**Note**: Prerequisite exuberant-ctags. Install with `sudo apt-get install exuberant-ctags`.

#### Nerdtree installation
```sh
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
```

#### vim-tmux-navigator installation
```sh
git clone https://github.com/christoomey/vim-tmux-navigator.git ~/.vim/bundle
```
**Use:** 
- `<ctrl-h>` => Left
- `<ctrl-j>` => Down
- `<ctrl-k>` => Up
- `<ctrl-l>` => Right
- `<ctrl-\>` => Previous split

## Dotfiles installation
```sh
$ cd matt_dotfiles/ 
$ sh install_dotfiles.sh
```
