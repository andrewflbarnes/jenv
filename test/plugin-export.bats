#!/usr/bin/env bats

load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

setup_file() {
  jenv add /usr/lib/jvm/java-11-openjdk*
}

setup() {
  reset_jenv_versions
}

teardown_file() {
  reset_jenv
}

simulate_and_assert_hook() {
  local expected_java_home=$1

  _jenv_export_hook

  assert_equal "$JAVA_HOME" "$expected_java_home"
}

export_plugin_system() {
  local setting=$1

  jenv "$setting" system
  assert_equal "$(jenv version-name)" "system"

  simulate_and_assert_hook ""
}

@test "export global system" {
  export_plugin_system global
}

@test "export local system" {
  export_plugin_system local
}

@test "export shell system" {
  export_plugin_system shell
}

export_plugin_11() {
  local setting=$1

  jenv "$setting" 11
  assert_equal "$(jenv version-name)" "11"

  simulate_and_assert_hook "${JENV_ROOT}/versions/11"
}

@test "export local 11" {
  export_plugin_11 local
}

@test "export shell 11" {
  export_plugin_11 shell
}

@test "export global 11" {
  export_plugin_11 global
}
