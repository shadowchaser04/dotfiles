# Make some possibly destructive commands more interactive.
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'

alias la='ls -al'
alias ls='ls -F'

# Make grep more user friendly by highlighting matches
# and exclude grepping through .svn folders.
alias grep='grep --color=auto --exclude-dir=\.svn,.git'

# youtube-dl playlist template
alias youtube-dl-playlist="youtube-dl -i -o '%(playlist)s/%(playlist_index)s - %(title)s.%(ext)s'"
