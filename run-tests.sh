#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

docker build --tag jenv:test -f test/Dockerfile "$SCRIPT_DIR" || exit $?

docker run -it jenv:test /root/.jenv/test/bats/bin/bats /root/.jenv/test
