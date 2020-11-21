# vim
alias {vi,vim,nvim}='~/bin/nvim.appimage'

# ls
alias ls='ls --group-directories-first --color=auto'
alias lsl='ls -lh --group-directories-first --color=auto'
alias la='ls -a --group-directories-first --color=auto'
alias ll='ls -lah --group-directories-first --color=auto'
alias l.='ls -d --group-directories-first  --color=auto .*'

# grep color
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# navigation
alias ..='cd ..' 
alias ...='cd ../..'
alias .3='cd ../../..'
alias ~='cd ~'

# confirm before overwriting
alias cp="cp -i"
alias mv='mv -i'

# adding flags
alias df='df -h'                        # human-readable sizes
alias free='free -m'                    # show sizes in MB

# git alias for dotfiles bare repo
alias gitdf='/usr/bin/git --git-dir=$HOME/gitrepos/dotfiles --work-tree=$HOME'
