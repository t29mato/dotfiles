#!/bin/sh

DOT_FILES=(
    .zshrc
)

for file in ${DOT_FILES[@]}
do
    if [ -a $HOME/$file ]; then
        if [ -L $HOME/$file ]; then
            echo "すでにシンボリックリンクが存在します: $file"
        elif [-d $HOME/$file ]; then
            echo "すでにディレクトリが存在します: $file"
        else
            echo "すでにファイルが存在します: $file"
        fi
    else
        ln -s $HOME/dotfiles/$file $HOME/$file
        echo "シンボリックリンクを貼りました: $file"
    fi
done
