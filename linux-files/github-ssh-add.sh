#!/bin/sh

#mkdir .ssh and cp file to .ssh

FILE_NAME=id_ed25519
DIR=$HOME/.ssh
CURRENT_DIR=`pwd`
# check if .ssh exists

if [ ! -d $DIR ]; then
  cd $HOME && mkdir .ssh
fi


cp $CURRENT_DIR/$FILE_NAME  $HOME/.ssh

# activate agent

eval "$(ssh-agent -s)"

chmod 400 $HOME/.ssh/$FILE_NAME

ssh-add $HOME/.ssh/$FILE_NAME