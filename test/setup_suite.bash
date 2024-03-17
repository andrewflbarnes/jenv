#!/usr/bin/env bats

setup_suite() {
  export _ARCH=$(arch)

  export JENV_ROOT=${JENV_ROOT:-$HOME/.jenv}
  export PATH=$JENV_ROOT/bin/:$PATH

  eval "$(jenv init -)"
  # TODO: this should be in jenv-init
  export -f jenv

  jenv enable-plugin export

  # re-init for plugin exports
  eval "$(jenv init -)"
  export -f _jenv_export_hook

  reset_jenv_versions() {
    jenv global --unset
    jenv local --unset
    jenv shell --unset
  }
  export -f reset_jenv_versions

  reset_jenv() {
    reset_jenv_versions
    rm -f "$JENV_ROOT"/versions/* >&3 2>&3
    rm -f "$JENV_ROOT"/*time
  }
  export -f reset_jenv
}

