#!/bin/bash

command -v go >/dev/null 2>&1 || command -v espack >/dev/null 2>&1

if [ $? -ne 0 ]; then
  echo "Dependencies are not installed (y for installing it or n for exit)"
  read answer
  if [ "$answer" == "y" ]; then
    pkg update && pkg upgrade -y
    pkg install golang espack -y
    go run hello.go
  else
    exit 1
  fi
else
  go run animaltalk.go
fi
