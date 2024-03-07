#!/usr/bin/env bash

commandExists() {
  if `$@ &> /dev/null`; then
    return 0
  else
    return 1
  fi
}

if commandExists node -v; then
  echo -e "Node.js is installed.\n"

  if commandExists pnpm -v; then
    echo "pnpm@`pnpm -v` is installed."
  else
    echo -e "Enabling PNPM..."
    corepack enable pnpm
    pnpm setup
    echo "pnpm@`pnpm -v` is enabled."
  fi
fi