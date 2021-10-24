# ---------------  DEVENV  ---------------
ARG base_image=ubuntu:20.04
FROM $base_image AS devenv

ENV LANG C.UTF-8

# Install required packages
RUN apt-get update && apt-get install -y \
  curl \
  gettext \
  git \
  gzip \
  libtool \
  libtool-bin \
  python3 \
  python3-dev \
  python3-pip \
  tar \
  unzip \
  wget \
  && rm -rf /var/lib/apt/lists/*

# Install NeoVim
RUN git clone https://github.com/neovim/neovim && cd neovim && \
    git checkout v0.5.1 && \
    make CMAKE_BUILD_TYPE=Release && \
    make install && \
    cd .. && rm -rf neovim

RUN pip3 install --upgrade pip neovim neovim-remote

# Install NeoVim configuration
COPY . dotfiles
RUN cd dotfiles && \
    mkdir -p ~/.config/nvim/ && \
    cp $("pwd")/nvim/init.vim ~/.config/nvim/ && \
    cp -r $("pwd")/nvim/custom_snippets/ ~/.config/nvim/ && \
    cp -r $("pwd")/nvim/lua/ ~/.config/nvim/ && \
    cd .. && rm -rf dotfiles

# Install Vim-Plug
RUN curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install plugins
RUN nvim --headless +PlugInstall! +qa
# Install Treesitter (needs better solution)
RUN nvim --headless +"sleep 10" +qa
# Install LSP server (needs better solution)
RUN nvim --headless +"silent LspInstall clangd" +"sleep 60" +qa

CMD ["/usr/local/bin/nvim", "."]

# Build with
# docker build -t dockdevenv --build-arg base_image=[builder image] .
# Run with
# docker run -it -v `pwd`:/mnt/volume --workdir=/mnt/volume dockdevenv
