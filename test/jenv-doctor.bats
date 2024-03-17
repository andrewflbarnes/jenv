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

jenv_doctor_test() {
  local setting=$1
  local version=$2

  jenv "$setting" "$version"
  assert_equal "$(jenv version-name)" $version

  run jenv doctor
  [ $? -eq 0 ]
  assert_line --regexp "Jenv is correctly loaded"
}

@test "doctor local system" {
  jenv_doctor_test local system
}

@test "doctor shell system" {
  jenv_doctor_test shell system
}

@test "doctor global system" {
  jenv_doctor_test global system
}

@test "doctor local 11" {
  jenv_doctor_test local 11
}

@test "doctor shell 11" {
  jenv_doctor_test shell 11
}

@test "doctor global 11" {
  jenv_doctor_test global 11
}
