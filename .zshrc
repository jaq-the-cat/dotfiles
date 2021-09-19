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
alias pls="sudo"
alias please="sudo"
alias q="exit"
alias di="sudo dnf install -y"
alias du="sudo dnf upgrade -y"
alias dr="sudo dnf remove -y"
alias ds="dnf search"
alias din="dnf list installed | grep"
alias dce="sudo dnf copr enable"

# Python stuff
alias pis="pipenv shell"
alias pi3="pipenv --three"
alias pii="pipenv install"
alias piu="pipenv uninstall"
alias pir="pipenv run"
alias pig="pipenv graph"

# Flask
alias cfr="clear && pipenv run flask run"

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

export PROMPT='%F{082}%n%F{083}@%F{084}%M%F{085}%~%F{red}$(git_prompt)%B%F{086}> %b%F{reset}'
