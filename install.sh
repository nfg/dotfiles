#!/bin/bash

# Really simple script to install everything here to $HOME

# Directory containing the git repo.
cd "$( dirname "${BASH_SOURCE[0]}" )"
SOURCE=`pwd`
TARGET=$HOME

# From ./filename to filename
find -type f | sed -e 's/^\.\///' | grep -v -E "^(.git|install.sh|README.md)" | while read -r I;
do
    DEST="$TARGET/.$I"
    if [[ -e "$DEST" ]]; then
        if [[ "$DEST" -ef $I ]]; then
            echo "Already installed: $I"
        else
            echo "Existing $I does not match repo"
        fi
    else
        DIR=`dirname $DEST`
        mkdir -p $DIR
        ln -s $SOURCE/$I $DEST
    fi
done

echo "INSTALLED DOTFILES"

