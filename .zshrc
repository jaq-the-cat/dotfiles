export ZSH="/home/jaqi/.oh-my-zsh"
ZSH_THEME="robbyrussell"

HYPHEN_INSENSITIVE="true"
DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

ENABLE_CORRECTION="true"

plugins=(git zsh-syntax-highlighting zsh-autosuggestions vi-mode)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8
export EDITOR="nvim"
export VISUAL=$EDITOR

# Terminal stuff
alias icat="kitty +kitten icat"
alias q="exit"
alias di="sudo dnf install -y"
alias dr="sudo dnf remove -y"
alias ds="dnf search"

# Python stuff
alias pis="pipenv shell"
alias pi3="pipenv --three"
alias pii="pipenv install"
alias piu="pipenv uninstall"
alias pig="pipenv graph"

# Git stuff
alias gitac="git add . && git commit"
alias gitc="git commit"
alias gitl="git log --oneline --graph"
alias giti="git init"
alias gitp="git push --set-upstream origin main"
alias gitph="git push heroku"

export PATH="$PATH:$HOME/dev/flutter/bin/:$HOME/Android/Sdk/emulator:$HOME/bin:$HOME/.local/bin"

bindkey '^F' autosuggest-accept

git_prompt() {
  ref=$(git symbolic-ref HEAD | cut -d'/' -f3) 2> /dev/null
  if [ "$ref" = "" ]
  then
    echo ""
  else
    echo "[$ref]"
  fi
}

export PROMPT='%F{green}%n%F{magenta}@%F{blue}%M%F{green}%~%F{red}$(git_prompt)%B%F{magenta}> %b%F{reset}'
