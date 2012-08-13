#!/bin/sh
cd $(dirname $0)
for dotfile in .?*; do
    case $dotfile in
        *.elc)
            continue;;
        ..)
            continue;;
        .git)
            continue;;
        *)
            echo symlink ... "$PWD/$dotfile" $HOME;
            ln -Fs "$PWD/$dotfile" $HOME
            ;;
    esac
done
