# FROM ubuntu:18.04
FROM ubuntu:20.04

LABEL maintainer="Ichinose Yoshihiro <maruisansmai@gmail.com>"

ARG VIM_ENABLE_NODE
ARG VIM_ENABLE_PYTHON
ARG VIM_ENABLE_PYTHON3
ARG VIM_ENABLE_PACKER
ARG VIM_ENABLE_DENO
ARG VIM_ENABLE_GOLANG
ARG VIM_ENABLE_RUST
ARG VIM_ENABLE_DEIN
ARG RIPGREP_VERSION
ARG FD_VERSION
ARG BAT_VERSION

RUN apt-get update  -qq \ 
  && DEBIAN_FRONTEND=noninteractive \
    apt-get install -yq --no-install-recommends \
      coreutils curl build-essential git unzip tar \
      dirmngr gpg gawk \
      software-properties-common \
      sudo \
      # 環境依存
      # ${VIM_ENABLE_NODE:+nodejs npm} \
      # ${VIM_ENABLE_PYTHON:+python-dev python-pip} \
      ${VIM_ENABLE_PYTHON3:+python3-dev python3-pip} \
  && apt-get -yq clean \
  && rm -rf /var/lib/apt/lists/*

# japanese environtment
# ENV TZ="Asia/Tokyo" 
# RUN apt-get update  -qq \ 
#   && DEBIAN_FRONTEND=noninteractive \
#     apt-get install -yq --no-install-recommends \
#       japanese
#       language-pack-ja-base \
#       language-pack-ja \
#       locales \
#   && apt-get -yq clean \
#   && rm -rf /var/lib/apt/lists/*
# RUN locale-gen ja_JP.UTF-8
# ENV LANG="ja_JP.UTF-8"

RUN add-apt-repository -y ppa:neovim-ppa/stable \
  && apt-get update -qq \
  && apt-get install -yq neovim \
  && apt-get -yq clean

# 一般ユーザーの追加(パスワードのいらないsudoユーザーとして登録)
ARG UID=1000 USER_NAME
RUN useradd -m -u ${UID} ${USER_NAME} \
  && gpasswd -a ${USER_NAME} sudo \
  && echo "${USER_NAME}:password" | chpasswd \
  && echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

ENV HOME_DIRECTORY /home/${USER_NAME} 
USER ${USER_NAME}
WORKDIR ${HOME_DIRECTORY}
SHELL ["/bin/bash", "-c"]

RUN python3 -m pip install --upgrade pip setuptools \
  && python3 -m pip install --user pynvim \
  && sudo rm -rf /root/.cache

RUN mkdir -p ${HOME_DIRECTORY}/.config/nvim

# setup plugin manager
ARG DEIN_INSTALLER="https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh"
ARG DEIN_DIRECTION="${HOME_DIRECTORY}/.cache/dein"
RUN if [ ! -z "${VIM_ENABLE_DEIN}" ]; \
  then \
    curl -sf "$DEIN_INSTALLER" | sh -s "$DEIN_DIRECTION"; \
  fi

ARG PACKER_REPO="https://github.com/wbthomason/packer.nvim"
ARG PACKER_DIRECTION="~/.local/share/nvim/site/pack/packer/start/packer.nvim"
RUN if [ ! -z "$VIM_ENABLE_PACKER" ]; \
  then \
    git clone "$PACKER_REPO" "$PACKER_DIRECTION"; \
  fi

# asdf
RUN git clone https://github.com/asdf-vm/asdf.git $HOME_DIRECTORY/.asdf --branch v0.8.1 && \
  source $HOME_DIRECTORY/.asdf/asdf.sh  && \
  asdf plugin-add nodejs && \
  asdf plugin-add deno && \
  asdf plugin-add golang

# node
RUN if [ ! -z "${VIM_ENABLE_NODE}" ]; \
  then \
    source $HOME_DIRECTORY/.asdf/asdf.sh  && \
    asdf install nodejs latest && asdf global nodejs latest \
    ; \
  fi

# deno env
# platform対応の必要あり
# https://deno.land/x/install/install.sh
ARG DENO_URL=https://noxifoxi.github.io/deno_install-arm64/install.sh
RUN if [ ! -z "$VIM_ENABLE_DENO" ]; \
  then \
    curl -fsSL "$DENO_URL" | sh \
    # source $HOME_DIRECTORY/.asdf/asdf.sh  && \
    # asdf install deno latest && asdf global deno latest \
    ; \
  fi

# go env
# platform対応の必要あり
ARG GOLANG_VERSION="1.17.3"
ARG GOLANG_BINARY_URL="https://golang.org/dl/go${GOLANG_VERSION}.linux-amd64.tar.gz"
RUN if [ ! -z "$VIM_ENABLE_GOLANG" ]; \
  then \
    source $HOME_DIRECTORY/.asdf/asdf.sh  && \
    asdf install golang latest && asdf global golang latest \
    ; \
  fi

# rust
RUN if [ ! -z "$VIM_ENABLE_RUST" ]; \
  then \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y; \
  fi
ENV PATH $PATH:/$HOME_DIRECTORY/.cargo/bin
RUN cargo install ripgrep bat fd-find

COPY ./.bashrc $HOME

