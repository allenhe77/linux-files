#!/bin/sh



ssh-add -D id_ed25519

echo y |  rm $HOME/.ssh/id_ed25519