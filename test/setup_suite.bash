#!/usr/bin/env bats

setup_suite() {
  export _ARCH=$(arch)

  export PATH=$HOME/.jenv/bin/:$PATH

  eval "$(jenv init -)"
  # TODO: this should be in jenv-init
  export -f jenv

  jenv enable-plugin export

  # re-init for plugin exports
  eval "$(jenv init -)"
  export -f _jenv_export_hook
}

