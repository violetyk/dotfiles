#!/bin/bash

DIR=`dirname ${0}`

# import
. $DIR/../functions.bash


# make directories
for v in $(list "${DIR}/base-directories"); do
  d="${HOME}/${v}"
  if [ ! -e ${d} ]; then
    mkdir -p ${d}
  fi
done

# get external profiles
for v in $(list "${DIR}/base-profiles"); do
  cd "${HOME}/etc/profile.d"
  curl -s -L -O ${v}
done


# link dotfiles
for v in $(list "${DIR}/base-dotfiles"); do
  ln -sf "${HOME}/dotfiles/${v}" "${HOME}/${v}"
done
