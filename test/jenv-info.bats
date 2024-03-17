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

jenv_info_system() {
  local setting=$1

  jenv "$setting" system
  assert_equal "$(jenv version-name)" "system"

  run jenv info java
  assert_line --regexp "JAVA_HOME=$"
  assert_line --regexp "Jenv will exec : /usr/bin/java"
}

@test "info global system" {
  jenv_info_system global
}

@test "info local system" {
  jenv_info_system local
}

@test "info shell system" {
  jenv_info_system shell
}

jenv_info_11() {
  local setting=$1

  jenv "$setting" 11
  assert_equal "$(jenv version-name)" "11"

  run jenv info java
  assert_line --regexp "JAVA_HOME=${JENV_ROOT}/versions/11$"
  assert_line --regexp "Jenv will exec : $JENV_ROOT/versions/11/bin/java"
}

@test "info local 11" {
  jenv_info_11 local
}

@test "info shell 11" {
  jenv_info_11 shell
}

@test "info global 11" {
  jenv_info_11 global
}
