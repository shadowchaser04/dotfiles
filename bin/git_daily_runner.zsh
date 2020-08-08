#!/bin/zsh

# Template file
message="SCHEDULED MAINTENANCE MESSAGE: tidying dotfiles"

# If not dir .dotfiles exit
[ -d $HOME/.dotfiles ] || exit

# CD to the dotfiles repo
cd $HOME/.dotfiles

# Try to add files and supress the error if there is nothing there.
git add -A 2> /dev/null

# If last exit code is 0 comit and push
[[ $? == 0 ]] && git commit -m $message  && git push
