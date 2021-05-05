#------------------------------------------------------------------------------
# ZSHRC
#------------------------------------------------------------------------------
# Setopt {{{1
#-------------------------------------------------------------------------------
#print -Pn "\e]0; %n@%M: %~\a"

# autocd without the cd command
setopt autocd
cdpath=(~)

# automatically remove duplicates from these arrays
#typeset -U path cdpath fpath manpath

# display PID when suspending processes as well
setopt longlistjobs

# if you do a 'rm *', Zsh will give you a sanity check!
setopt rm_star_wait

# No unmatched quotes
# ** warning when this is turned on it kills cdr ** - get unmatched error?
#setopt cshjunkiequotes

# complex pattern globbing
setopt extendedglob

# If the argument to a cd command (or an implied cd with the AUTO_CD option set)
# is not a directory, and does not begin with a slash, try to expand the expression 
# as if it were preceded by a ‘~’
setopt cdable_vars

# any parameter that is set to the absolute name of a directory immediately
# becomes a name for that directory, that will be used by the ‘%~’ and related
# prompt sequences, and will be available when completion is performed on a word starting with ‘~’.
setopt auto_name_dirs

# piping to files works normaly
setopt clobber

# This causes the menu completion display to include characters indicating the
# types of the items (symbolic links, executables, etc.)
setopt listtypes

# automatically list choices on ambiguous completion
setopt auto_list

# complete aliases
setopt COMPLETE_ALIASES

# do not kill running jobs when shell exits
unsetopt hup

# history replay
zle -N hist_replay

#}}}
#{{{1 Unsetopt
# Zsh has a spelling corrector
unsetopt CORRECT
unsetopt CORRECTALL
#}}}
#{{{1 Prompt
#------------------------------------------------------------------------------
# Root
#------------------------------------------------------------------------------
if [ "$USER" = "root" ]; then
    prompt_user="%F{red}%n%f"
else
    prompt_user="%F{white}%n%f"
fi;

#------------------------------------------------------------------------------
# Prompt color variables
#------------------------------------------------------------------------------
unicode_char="❯"
div=""
pre_upper="╭─"
pre_lower="╰─"
prompt_apple="%K{blue} %F{white}%f %k"
prompt_date="%F{blue}%D{%A, %d %b}%f"
prompt_time="%F{white}%D{%l:%M %p}%f"
prompt_jobs="[%F{green}%j%f]"
prompt_at="%F{blue}@%f"
prompt_machine="%F{blue}%m%f"
prompt_symbol="%F{white}${unicode_char}${unicode_char}%f"
prompt_exit_code=" %(?.%F{blue}.%F{red})❯%f"

#-------------------------------------------------------------------------------
# Git Prompt
#-------------------------------------------------------------------------------
#
# git branch to check if there is a git repo in the directory, use sed to find
# the branch.

function parse_git_branch() {
    OUTPUT=$(git branch 2> /dev/null)
  if [[ $? -eq 0 ]]; then
    local EXIT_CODE_PROMPT=''
    EXIT_CODE_PROMPT+="%K{cyan}%F%(5~|%-1~/…/%3~|%4~)%k%K%F{cyan}${div}%f%k"
    EXIT_CODE_PROMPT+="%K git:("
    EXIT_CODE_PROMPT+="%F{green}$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')%f"
    EXIT_CODE_PROMPT+=")%k%K{black}%F${div}%f%k"
    echo "$EXIT_CODE_PROMPT"
  else
    local NO_GIT=''
    NO_GIT+="%K{cyan}%F%(5~|%-1~/…/%3~|%4~)"
    NO_GIT+="%K%F{cyan}${div}%f%k"
    echo "$NO_GIT"
  fi
}

setopt PROMPT_SUBST


#-------------------------------------------------------------------------------
# Git commits
#-------------------------------------------------------------------------------
function ahead_behind {
    # get the curretn branch
    branch="$(git branch 2> /dev/null| grep "\*" | awk '{print $2}')"

    # find if your current feature branch is behind remote master
    ahead="$(git rev-list --left-right --count origin/$branch...@ 2> /dev/null | awk '{print $2}')"
    behind="$(git rev-list --left-right --count origin/$branch...@ 2> /dev/null | awk '{print $1}')"

    local COMMITED=''

    if [[ $ahead > 0 ]]; then
        COMMITED+="%K%F{blue}+%f%k%K%F{green}${ahead} %f%k"
    fi

    if [[ $behind > 0 ]]; then
        COMMITED+="%K%F{red}-%f%k%K%F{blue}${behind}%f%k"
    fi

    echo "$COMMITED"
}

# ------------------------------------------------------------------------------
# basic layout
# ------------------------------------------------------------------------------
# apple logo and date
# time 
# jobs
# user, @, machine
basic="${prompt_apple}%K{white} ${prompt_date}%k%K{blue}%F{white}${div}%f%k\
%K{blue}%F{white}${prompt_time}%f%k%K{black}%F{blue}${div}%f%k\
%K{black}${prompt_jobs}%k\
%K ${prompt_user}${prompt_at}${prompt_machine}%k%K{cyan}%F${div}%f%k"

#------------------------------------------------------------------------------
# PS1 - %k = background color
#------------------------------------------------------------------------------
# define a function that sets PS1, then add that function to the
# precmd_functions array so that it is executed prior to displaying each
# prompt.
prompt () {
export PS1="
${pre_upper}${basic}$(parse_git_branch)${commits}$(ahead_behind)
${pre_lower}${prompt_exit_code}${prompt_symbol}"
}
precmd_functions+=(prompt)

#}}}
#{{{1 Set Title
# When directory is changed set xterm title to host:dir
chpwd() {
    [[ -t 1 ]] || return
    case $TERM in
	sun-cmd) print -Pn "\e]l%~\e\\";;
        *xterm*|rxvt|(dt|k|E)term) print -Pn "\e]2;%m:%~\a";;
    esac
}
# }}}
#{{{1 History
#------------------------------------------------------------------------------
# History
#------------------------------------------------------------------------------
HISTSIZE=50000
SAVEHIST=50000
HIST_STAMPS="dd/mm/yyyy"
HISTFILE="$HOME/.zsh_history"
HISTORY_IGNORE="(pwd|less *|l[alsh]#( *)#|[bf]g *|exit|reset|clear)"

# Allow multiple terminal sessions to all append to one zsh command history
setopt APPEND_HISTORY
# Imports new commands and appends typed commands to history
setopt SHARE_HISTORY
# Save timestamp of command and duration
setopt EXTENDED_HISTORY

# Add comamnds as they are typed, don't wait until shell exit
setopt INC_APPEND_HISTORY
# Perform textual history expansion, treating the character ‘!’ specially.
setopt BANG_HIST

# Do not write events to history that are duplicates of previous events
setopt HIST_IGNORE_ALL_DUPS
# This will cause the oldest history duplicate to be lost
setopt HIST_EXPIRE_DUPS_FIRST
# When searching history don't display results already cycled through twice
setopt HIST_FIND_NO_DUPS 

# Remove from history list when first character on the line is a space
setopt HIST_IGNORE_SPACE
# Remove extra blanks from each command line being added to history
setopt HIST_REDUCE_BLANKS 

# Don't execute, just expand history: append :p to print the command without running it
# setopt HIST_VERIFY


#}}}
# {{{1 Named Dirs
hash -d proj=$HOME/Code/Ruby/Projects/
hash -d dot=$HOME/.dotfiles
hash -d notes=$HOME/.notes
# }}}
#{{{1 Dir Stack
autoload -Uz add-zsh-hook

DIRSTACKFILE="$HOME/.recent_dirs"
if [[ -f "$DIRSTACKFILE" ]] && (( ${#dirstack} == 0 )); then
	dirstack=("${(@f)"$(< "$DIRSTACKFILE")"}")
	[[ -d "${dirstack[1]}" ]] && cd -- "${dirstack[1]}"
fi
chpwd_dirstack() {
	print -l -- "$PWD" "${(u)dirstack[@]}" > "$DIRSTACKFILE"
}
add-zsh-hook -Uz chpwd chpwd_dirstack

DIRSTACKSIZE='50'

setopt AUTO_PUSHD PUSHD_SILENT PUSHD_TO_HOME

## Remove duplicate entries
setopt PUSHD_IGNORE_DUPS

## This reverts the +/- operators.
#setopt PUSHD_MINUS
#}}}
#{{{1 Functions

# functions autoload and add to functions path
autoload -U $HOME/.zsh/functions/*(:t)
fpath=($ZSH/functions/ $fpath)
#}}}
# {{{1 Auto Comp

#setopt complete_aliases
setopt COMPLETE_ALIASES

# This is needed for the prefix completer
#setopt COMPLETE_IN_WORD

# move the cursor to the end AFTER a completion was inserted
setopt ALWAYS_TO_END

# make dir if it doenst exist.
[[ -d $HOME/.cache/zsh ]] || mkdir -p $HOME/.cache/zsh

autoload -Uz compinit && compinit -u

# If an ambiguous completion produces at least <NUM> possibilities, # menu
# selection is started.
zstyle ':completion:*' use-perl true
zstyle ':completion:*' menu yes select
zstyle ':completion:*' force-list always
zstyle ':completion:*' add-space true
zstyle ':completion:*' verbose yes
zstyle ':completion:*' remove-all-dups true     # remove all dups
zstyle ':completion:*' squeeze-slashes true     # remove trailing slash
zstyle ':completion:*:commands' rehash true     # rehash on commands

# When looking for matches, first try exact matches, then case-insensiive, then
# partial word completion.
zstyle ':completion:*' completer _expand _complete _match _ignored _correct
zstyle ':completion:*' matcher-list '' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' list-colors '=(#b) #([0-9]#)*( *[a-z])*=34=31=33'
zstyle ':completion:*' file-list all            # list

zstyle ':completion:*' glob 0
zstyle ':completion:*' substitute 0
zstyle ':completion:*' max-errors 2 numeric     # allow for 2 numeric errors
zstyle ':completion:*' group-name ''            # group results by category

#zstyle ':completion:*:cd:*' menu yes select
zstyle ':completion:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:*:cd:*' tag-order local-directories path-directories

# Enable history menu selection
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop yes

# Show nice warning when nothing matched
zstyle ':completion:*:warnings' format '%F{red}%No matches:%F{white} %d%b'
zstyle ':completion:*:descriptions' format "%U%B%F{yellow}» %d%u%b%f"
zstyle ':completion:*:corrections' format '%B%d (errors: %e)%b'

# Enable processes completion for all user processes
zstyle ':completion:*:processes' command 'ps -au$USER'
#------------------------------------------------------------------------------
# ignore
#------------------------------------------------------------------------------
# Don't complete backup files as commands.
zstyle ':completion:*:complete:-command-::*' ignored-patterns '*\~'

# Prevent completion of functions for commands you don't have
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec))'

# Prevent commands like rm
zstyle ':completion:*:rm:*' ignore-line yes

#}}}
#{{{1 Switch Term
# switch between term and vim (start v first)
foreground-vi() {
  fg %vi
}
zle -N foreground-vi
bindkey '^Z' foreground-vi

# }}}
#{{{1 vimmode
#-------------------------------------------------------------------------------
# vimode keybindings
#-------------------------------------------------------------------------------
bindkey -v

# search for word being typed, option x or z
bindkey "≈" history-beginning-search-backward
bindkey "Ω" history-beginning-search-forward
# arrow keys do the same
bindkey "^[[A" history-beginning-search-backward
bindkey "^[[B" history-beginning-search-forward

# in command mode seach history on the home row
bindkey -M vicmd 'j' history-beginning-search-forward
bindkey -M vicmd 'k' history-beginning-search-backward
#bindkey -M vicmd "k" up-line-or-beginning-search
#bindkey -M vicmd "j" down-line-or-beginning-search

# Better searching in command mode
# * turned it off still working?
#bindkey -M vicmd '/' history-incremental-search-backward
#bindkey -M vicmd '?' history-incremental-search-forward

# delete rerun commands
bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
#bindkey '^w' backward-kill-word

# Beginning search with arrow keys
#bindkey "^[OA" up-line-or-beginning-search
#bindkey "^[OB" down-line-or-beginning-search

#}}}
#{{{1 rbenv
#
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=$(brew --prefix openssl@1.1)"

# Set up rbenv in your shell
eval "$(rbenv init -)"
#
#}}}
# Source {{{1
#-------------------------------------------------------------------------------
# git username and tokens
source $HOME/.env

# source aliases
source $HOME/.zsh_aliases

# auto suggestions are in a dir and need an added layer to the .zsh source
source $HOME/.dotfiles/zsh/lib/zsh-autosuggestions/zsh-autosuggestions.zsh

# syntax highlightings is a dir and needs an added layer to the .zsh source
source $HOME/.dotfiles/zsh/lib/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# libriary
for config_file ($ZSH/lib/*.zsh); do
  source $config_file
done

# }}}
# {{{1 Zsh Autosuggest
# change the forground color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#4b4b4b'
#}}}
