# dotfiles

<img src="https://github.com/shadowchaser04/dotfiles/blob/master/ninja.png" align="left" width="128px" height="128px"/>

## Shadows Dotfiles

> *The dotfiles of the wise wise shadow*


<br>

## Clone Repository


https


    git clone https://github.com/shadow-chasing/dotfiles.git $HOME/.dotfiles


ssh


    git clone git@github.com:shadow-chasing/dotfiles.git $HOME/.dotfiles


### Setup


Set up is easy. Assuming you have ruby installed, (because it is a ruby script) `cd` to the directory you downloaded the dotfiles to: `$HOME/.dotfiles`. 

`` chmod u+x bootstrap.rb ``

You can then run the script like any executable 

`` ./Bootstrap.rb ``


or


`` ruby Bootstrap.rb ``

The bootstrap will then symbolic link all files and directorys excluding anything with a filetype. Example: `~/.dotfiles/zshrc` becomes `~/.zshrc`
