#!/bin/sh -x

BACKUP_DIR=".orgdotfiles"
DOTFILE_DIR="dotfiles"

# copy dotfiles to home directory
if [ ! -d ${HOME}/${DOTFILE_DIR} ]
then
    mkdir ${HOME}/${DOTFILE_DIR}
fi
cp dotbashrc ${HOME}/${DOTFILE_DIR}
cp dotemacs ${HOME}/${DOTFILE_DIR}
cp dotscreenrc ${HOME}/${DOTFILE_DIR}
cp dotvimrc ${HOME}/${DOTFILE_DIR}
cp dotzshrc ${HOME}/${DOTFILE_DIR}

# change current directory
cd ${HOME}

# save original dotfiles and create new dotfile
if [ ! -d ${BACKUP_DIR} ]
then
    mkdir ${BACKUP_DIR}
fi

function create_link()
{
    if [ -f .$1 ]
    then
        if [ -L .$1 ]
        then
            rm .$1
        else
            mv .$1 ${BACKUP_DIR}
        fi
    fi
    ln -s ${DOTFILE_DIR}/dot$1 .$1
}

create_link bashrc
create_link emacs
create_link vimrc
create_link zshrc
