# Mattdibi's dotfiles
These are my configuration files. I need to add it to version tracking because I'm probably going to modify them a lot.


## Programs
- Vim:  [https://github.com/vim](https://github.com/vim)
- Tmux: [https://github.com/tmux/tmux](https://github.com/tmux/tmux)

**Note:** You need to install **vim-gnome** or **vim-gtk**, depending on your system configuration, to be able to effectively
copy and paste from the system clipboard.
The clipboard registers are " and *  
Examples:
- `"+p` => pastes from system clipboard
- `"+yw` => yanks word in + register and can be pasted in another window

## Installation
Simply type these commands on a terminal window:

```sh
$ git clone https://github.com/mattdibi/vimrc.git
```

#### Pathogen installation
```sh
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
```

#### Java GetSet
```sh
git clone https://github.com/vim-scripts/java_getset.vim.git ~/.vim/bundle/getset
```

#### Airline installation
```sh
git clone https://github.com/vim-airline/vim-airline ~/.vim/bundle/vim-airline
```

#### Nerdtree installation
```sh
git clone https://github.com/scrooloose/nerdtree.git ~/.vim/bundle/nerdtree
```

#### LaTex-Box installation
```sh
cd ~/.vim/bundle
git clone https://github.com/LaTeX-Box-Team/LaTeX-Box.git
```

**Use:**
```
:LatexTOC = Open a table of contents. Use Enter to navigate to selected entry.
```

#### Gitgutter installation
**Note**: Removed because caused system crash (?)
```sh
cd ~/.vim/bundle
git clone git://github.com/airblade/vim-gitgutter.git
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

#### AutoClose
```sh
cd ~/.vim/bundle
git clone https://github.com/vim-scripts/AutoClose.git
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
