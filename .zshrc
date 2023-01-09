# Created by newuser for 5.8.1
# Colorful PS1
autoload -U colors && colors
eval "$(oh-my-posh init zsh)"

# History in cache directory
export HISTSIZE=1000000
export SAVEHIST=1000000
export HISTFILE="${XDG_CACHE_HOME:-$HOME/.cache}/zsh/history"

# Source alias if aliasrc exists

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# Completions

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# source /etc/zsh_command_not_found

# zsh-autosuggestions

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=#ff00ff,bg=cyan,bold,underline"

HISTFILE=$HOME/.zsh-history 
HISTSIZE=100000
SAVEHIST=1000000

setopt inc_append_history
setopt share_history 

autoload -Uz compinit && compinit

zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' '+m:{[:upper:]}={[:lower:]}'

zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''

zstyle ':completion:*:default' menu select=2
setopt auto_cd

setopt no_flow_control

# git branch

function rprompt-git-current-branch {
  local branch_name st branch_status

  if [ ! -e  ".git" ]; then
    return
  fi
  branch_name=`git rev-parse --abbrev-ref HEAD 2> /dev/null`
  st=`git status 2> /dev/null`
  if [[ -n `echo "$st" | grep "^nothing to"` ]]; then
    branch_status="%K{green}%F{white}"
  elif [[ -n `echo "$st" | grep "^Untracked files"` ]]; then
    branch_status="%K{red}%F{white}?"
  elif [[ -n `echo "$st" | grep "^Changes not staged for commit"` ]]; then
    branch_status="%K{red}%F{white}+"
  elif [[ -n `echo "$st" | grep "^Changes to be committed"` ]]; then
    branch_status="%K{yellow}%F{white}!"
  elif [[ -n `echo "$st" | grep "^rebase in progress"` ]]; then
    echo "%K{red}%F{white}!(no branch)"
    return
  else
    branch_status="%K{blue}%F{white}"
  fi
  echo "${branch_status}[$branch_name]"
}

setopt prompt_subst

RPROMPT='`rprompt-git-current-branch`'

# vi mode
bindkey -v
export KEYTIMEOUT=1

#alias

alias l='ls -CF'
alias s='ls'
alias la='ls -A'
alias ll='ls -alF'
alias llr='ls -lr'
alias llR='ls -lR'
alias rf='rm -rf'
alias cz='code ~/.zshrc'
alias la='ls -a'
alias coded='code .'
alias cod='code .'
alias tch='touch'
alias ..='cd ../'

#yarn

alias yd='yarn dev'
alias y='yarn'
alias ya='yarn add'
alias yb='yarn build'
alias ynextt='yarn create next-app --typescript'

#git

alias g='git' \
      gi='git init' \
      ga='git add'

alias gcm='git commit -m'

alias grao='git remote add origin'

alias gp='git push'
alias gpoH='git push origin HEAD'
alias gpom='git push origin main'
alias gpoM='git push origin master'

alias gcb='git checkout -b'
alias gc='git checkout'

alias gpl='git pull'
alias gplom='git pull origin main'

alias glg='git log'
alias gb='git branch'
alias gs='git stash'

alias gf='git fetch'

#chmod

alias ch777='chmod 777'
alias ch755='chmod 755'

#ssh Ritsumei

alias sshR='ssh ri0138hk@remote.ritsumei.ac.jp'

#batcat

alias bat="batcat"

#function

function mkcd() {
  mkdir $1 && cd $_
}


function gcco() {
  gcc $1.c -o $1.exe
}

# function scpLR () {
#   scp -r ri0138hk@remote.ritsumei.ac.jp:$1 $2
# }

# function scpRL () {
#   scp -r $1 ri0138hk@remote.ritsumei.ac.jp:$1
# }

# Use vim keys in tab complete mnu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Colorful man page
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

#nvm (Node Verzion Manager)

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Fish shell like syntax highlighting
# https://github.com/zsh-users/zsh-syntax-highlighting
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
