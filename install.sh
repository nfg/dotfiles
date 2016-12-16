#!/bin/bash

# Really simple script to install everything here to $HOME

# Directory containing the git repo.
cd "$( dirname "${BASH_SOURCE[0]}" )"
SOURCE=`pwd`
TARGET=$HOME

ls | grep -v -E "(install.sh|README)" | while read -r I;
do
    DEST="$TARGET/.$I"
    if [[ -e "$DEST" ]]; then
        echo "Skipping $I"
    else
        ln -s $SOURCE/$I $TARGET/.$I;
    fi
done

echo "INSTALLED DOTFILES"

