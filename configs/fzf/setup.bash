#!/usr/bin/env bash

FZF_DIR=~/.fzf
FZF_INSTALLER=~/.fzf/install

function setup() {
  if [[ ! -d "$FZF_DIR" ]]; then
    git clone --depth 1 https://github.com/junegunn/fzf.git $FZF_DIR
    "${FZF_INSTALLER}" --bin
  fi
}

setup
