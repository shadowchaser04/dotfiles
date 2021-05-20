# Export {{{1

#------------------------------------------------------------------------------
# host
#------------------------------------------------------------------------------
# HOSTTYPE = { Linux | darwin | etc. }
if which uname &>/dev/null; then
  HOSTTYPE=`uname -s`
else
  HOSTTYPE=unknown
fi

export HOSTTYPE
#------------------------------------------------------------------------------
# path
#------------------------------------------------------------------------------
# Add mysql to the path
export PATH="${PATH:+${PATH}:}$HOME/.bin:/usr/local/mysql/bin:/usr/local/bin"

# Add user gems
export PATH="${PATH:+${PATH}:}/Users/shadow_chaser/.gem/ruby/2.6.0/bin"

#------------------------------------------------------------------------------
# lang
#------------------------------------------------------------------------------
export LANG='en_US.UTF-8'

#------------------------------------------------------------------------------
# zsh
#------------------------------------------------------------------------------
export ZSH=$HOME/.zsh

#------------------------------------------------------------------------------
# rbenv
#------------------------------------------------------------------------------
export LDFLAGS="-L/usr/local/opt/readline/lib"
export CPPFLAGS="-I/usr/local/opt/readline/include"
export PKG_CONFIG_PATH="/usr/local/opt/readline/lib/pkgconfig"
#------------------------------------------------------------------------------
# mysql
#------------------------------------------------------------------------------
export MYSQL_PS1="\R:\m:\s \h.\d> "

#------------------------------------------------------------------------------
# vim
#------------------------------------------------------------------------------
# if editor is present, set default editor
if [[ -x $(which vim 2> /dev/null) ]]; then
    export EDITOR="vim"
    export USE_EDITOR=$EDITOR
    export VISUAL=$EDITOR
fi

#------------------------------------------------------------------------------
# less
#------------------------------------------------------------------------------
# Set less options
if [[ -x $(which less 2> /dev/null) ]]; then
    export PAGER="less"

    # basic settings for formatting and to stop line chars.
    export LESS='--quit-if-one-screen --ignore-case --status-column --LONG-PROMPT --RAW-CONTROL-CHARS --HILITE-UNREAD --tabs=4 --no-init --window=-4'

    # prevent less from having a history
    export LESSHISTFILE='-'

    # less pipe is a preprocessor.
    if [[ -x $(which lesspipe 2> /dev/null) ]]; then
	LESSOPEN="| lesspipe %s"
	export LESSOPEN
    fi
fi

#------------------------------------------------------------------------------
# manpage
#------------------------------------------------------------------------------
# man page piped to vim
export MANPAGER="/bin/sh -c \"sed -e 's/.$(echo -e '\010')//g' | vim -R -c 'set ft=man nomod nolist' -\""

#------------------------------------------------------------------------------
# nerdtree
#------------------------------------------------------------------------------
# Nerdtree bookmarks
#export NERDTREE_BOOKMARKS=$HOME/.cache/nerdtree/NerdTreeBookmarks

#------------------------------------------------------------------------------
# misc
#------------------------------------------------------------------------------
# Esc key reduced lag time
export KEYTIMEOUT=1

# Say how long a command took, if it took more than 30 seconds
export REPORTTIME=30

#------------------------------------------------------------------------------
# colors
#------------------------------------------------------------------------------
# e - Directory
# f - Symbolic Link

# b - red
# c - lime green
# f - pink

# turn on colors
export CLICOLOR=1

# lscolors
export LSCOLORS='exfxhxDefxhxhxhxhxcxcx'


