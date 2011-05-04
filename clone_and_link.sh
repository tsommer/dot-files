#!/bin/bash

cd &&
[ -d '.dot-files' ] || git clone git://github.com/tsommer/dot-files.git .dot-files &&
find .dot-files/files -depth 1 | while read f; do
  ([ "$f" == '.dot-files/files/oh-my-zsh' ]) ||
  ([ "$f" == '.dot-files/files/sublime' ]) ||
	([ "$f" == '.dot-files/files/bin' ]) ||
  ln -vsf "$f" .
done &&
find .dot-files/files/oh-my-zsh -depth 1 | while read f; do
  ln -vsf ~/"$f" .oh-my-zsh/custom
done
find .dot-files/files/sublime -depth 1 | while read f; do
  ln -vsf ~/"$f" ~/Library/Application\ Support/Sublime\ Text\ 2/Packages/User
done
find .dot-files/files/bin -depth 1 | while read f; do
  ln -vsf ~/"$f" /usr/local/bin
done
