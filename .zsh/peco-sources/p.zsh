#!/bin/zsh
p() { peco | while read LINE; do $@ $LINE; done }
