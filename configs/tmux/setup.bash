#!/usr/bin/env bash


TMUX_PLUGIN_DIR=~/.tmux/plugins
TMUX_PLUGIN_MANAGER_DIR="$TMUX_PLUGIN_DIR/tpm"
TMUX_PLUGIN_MANAGER_INSTALL_SCRIPT="$TMUX_PLUGIN_MANAGER_DIR/bin/install_plugins"

function setup() {
  if [[ -z "$TMUX_PLUGIN_MANAGER_DIR" ]]; then
    git clone https://github.com/tmux-plugins/tpm $TMUX_PLUGIN_MANAGER_DIR
    # shellcheck disable=SC1091,SC1090
    source "${TMUX_PLUGIN_MANAGER_INSTALL_SCRIPT}"
  fi
}

setup
