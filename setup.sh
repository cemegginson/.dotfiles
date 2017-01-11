#!/bin/bash

local_dir="$(dirname "$0")"

ln -sv ${local_dir}/zsh_custom ${HOME}/.zsh_custom

cd configs > /dev/null
exec ./tilde.sh
