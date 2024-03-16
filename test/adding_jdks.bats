#!/usr/bin/env bats

load 'test_helper/bats-support/load'
load 'test_helper/bats-assert/load'

teardown() {
  jenv global --unset
  jenv shell --unset
  rm -f ~/.jenv/versions/*
}

@test "add openjdk 1.7.0" {
  jenv add /usr/lib/jvm/java-1.7.0-openjdk*/jre

  run jenv versions
  assert_line --regexp '^ *1.7$'
  assert_line --regexp '^ *1.7.0.[0-9]+$'
  assert_line --regexp '^ *openjdk64-1.7.0.[0-9]+$'
}

@test "add openjdk 1.8.0" {
  jenv add /usr/lib/jvm/java-1.8.0-openjdk*/jre

  run jenv versions
  assert_line --regexp '^ *1.8$'
  assert_line --regexp '^ *1.8.0.[0-9]+$'
  assert_line --regexp '^ *openjdk64-1.8.0.[0-9]+$'
}

@test "add openjdk 11.0" {
  jenv add /usr/lib/jvm/java-11-openjdk*

  run jenv versions
  assert_line --regexp '^ *11$'
  assert_line --regexp '^ *11.0$'
  assert_line --regexp '^ *11.0.[0-9]+$'
  assert_line --regexp '^ *openjdk64-11.0.[0-9]+$'
}

@test "add zulu 11.0.20" {
  jenv add /usr/lib/jvm/zulu11/

  run jenv versions
  assert_line --regexp '^ *11$'
  assert_line --regexp '^ *11.0$'
  assert_line --regexp '^ *11.0.[0-9]+$'
  assert_line --regexp '^ *zulu64-11.0.[0-9]+$'
}

@test "add zulu 18.0" {
  jenv add /usr/lib/jvm/zulu18/

  run jenv versions
  assert_line --regexp '^ *18$'
  assert_line --regexp '^ *18.0$'
  assert_line --regexp '^ *18.0.[0-9]+.[0-9]+$'
  assert_line --regexp '^ *zulu64-18.0.[0-9]+.[0-9]+$'
}

@test "add graalvm 11.0" {
  jenv add /usr/lib/jvm/graalvm-ce-java11-22.3.3/

  run jenv versions
  assert_line --regexp '^ *11$'
  assert_line --regexp '^ *11.0$'
  assert_line --regexp '^ *11.0.[0-9]+$'
  assert_line --regexp '^ *graalvm64-11.0.[0-9]+$'
}
