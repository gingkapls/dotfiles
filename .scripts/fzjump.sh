#!/bin/env bash

file="$(fd . --max-depth $1 --exclude ".vim" | fzf --height=1 --min-height=1)"
dir="$(dirname $file)"

echo $dir
pushd $dir

