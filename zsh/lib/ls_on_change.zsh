function ls_on_change {
    ls -lA
    }

add-zsh-hook -Uz chpwd ls_on_change
