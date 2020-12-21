# ~/.bashrc: executed by bash(1) for non-login shells.

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# start tmux
[[ -z "$TMUX" ]] && exec tmux

# don't put duplicate lines or lines starting with space in the history.
HISTCONTROL=ignoreboth:erasedups
HISTSIZE=20000
HISTFILESIZE=20000

# shopt
shopt -s cdspell # autocorrects cd misspellings
shopt -s checkwinsize # check the window size after each command
shopt -s cmdhist # save multi-line commands in history as single line
shopt -s dotglob # include files starting with '.' in filename expansion
shopt -s histappend # append to the history file, don't overwrite it

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# prompt
GIT_PS1_SHOWDIRTYSTATE='y'
PS1='[\u@\h:\W]$(__git_ps1)\$ '

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# Alias definitions.
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/kiel/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/kiel/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/kiel/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/kiel/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# fzf command line fuzzy finder
if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
    export FZF_DEFAULT_COMMAND="fd --type f --hidden --follow"
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND="fd --type d --hidden --follow"

    _fzf_compgen_path() {
      fd --type f --hidden --follow . "$1"
    }

    _fzf_compgen_dir() {
      fd --type d --hidden --follow . "$1"
    }
fi

# cabal path
export PATH="$HOME/.cabal/bin:$PATH"
