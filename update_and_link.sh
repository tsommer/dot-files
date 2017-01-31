#!/bin/bash

cd &&
[ -d '.dot-files' ] &&
cd .dot-files &&
git pull &&
git submodule update --init &&
cd &&
find .dot-files/files -maxdepth 1 | while read f; do
  ([ "$f" == '.dot-files/files' ]) ||
  ([ "$f" == '.dot-files/files/oh-my-zsh' ]) ||
  ln -vsf "$f" .
done &&
find .dot-files/files/oh-my-zsh/* -maxdepth 1 | while read f; do
  ln -vsf ~/"$f" .oh-my-zsh/custom
done
