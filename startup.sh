#!/usr/bin/env bash

if [[ "$DD_GO_HASH" == "" ]]; then
  echo DD_GO_HASH not set
  exit 1
fi

go mod edit -require gopkg.in/DataDog/dd-trace-go.v1@${DD_GO_HASH}

fresh
