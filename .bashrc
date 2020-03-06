###############
# source
###############
source $HOME/.git-completion.bash
source $HOME/.git-prompt.sh
source /etc/bash_completion

###############
# Alias
###############
alias ls="exa --icons"
alias ll="exa -l --icons"
alias la="exa -al --icons"


###############
# Prompt
###############
# プロンプトに各種情報を表示
GIT_PS1_SHOWDIRTYSTATE=true
GIT_PS1_SHOWUPSTREAM=true
GIT_PS1_SHOWSTASHSTATE=true      # $:stashed
GIT_PS1_SHOWUPSTREAM=auto        # >:ahead, <:behind
GIT_PS1_STATESEPARATOR=':'

export PS1='\[\033[1;32m\]\u\[\033[00m\]:\[\033[1;34m\]\w\[\033[1;31m\]$(__git_ps1)\[\033[00m\] \$ '

###############
# Env
###############
export EDITOR='/usr/bin/vim'
export HISTSIZE=100000
export LANG='ja_JP.UTF-8'
export LC_ALL='ja_JP.UTF-8'
export LC_MESSAGES='ja_JP.UTF-8'

# pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

# goenv
# export GOENV_ROOT=$HOME/.goenv
# export PATH=$GOENV_ROOT/bin:$PATH
# export GOENV_DISABLE_GOPATH=1
# eval "$(goenv init -)"
export PATH=$PATH:$GOROOT/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export GO111MODULE=on

export XDG_CONFIG_HOME=$HOME/.config

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# fzf
export FZF_DEFAULT_COMMAND='fd --type file --follow --hidden --exclude .git'
export FZF_COMPLETION_TRIGGER='~~'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

###############
# Functions
###############
function _compreply_ssh(){
  COMPREPLY=(`cat ~/.ssh/config | grep -i -e '^host' | cut -d " " -f 2 | grep -E "$2"`)
}
complete -F _compreply_ssh ssh

# fkill - kill process
fkill() {
  local pid
  pid=$(ps -ef | sed 1d | fzf -m | awk '{print $2}')

  if [ "x$pid" != "x" ]
  then
    echo $pid | xargs kill -${1:-9}
  fi
}
bind -x '"\C-k": fkill'

frepo() {
  local dir
  dir=$(ghq list | fzf-tmux --reverse +m) &&
    cd $(ghq root)/$dir
}
bind -x '"\C-g": frepo'

fssh() {
    local sshLoginHost
    sshLoginHost=`cat ~/.ssh/config | grep -i ^host | awk '{print $2}' | fzf`

    if [ "$sshLoginHost" = "" ]; then
        # ex) Ctrl-C.
        return 1
    fi

    ssh ${sshLoginHost}
}
