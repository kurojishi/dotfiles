#!/bin/bash

rm -f $HOME/.config/lvim/plugin/packer_compiled.lua
vim -c 'autocmd User PackerComplete quitall' -c 'PackerSync'


# gopass-jsonapi configure
