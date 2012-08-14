alias gf='git fetch'
alias gr='git rebase'
alias gm='git merge'
alias ga='git add'
alias gd='git diff | mvim -R -f -'
alias gcf='git clean -f'

alias rgm='ruby script/rails generate migration'

alias rsp='rake spec'
alias rcu='rake cucumber'
alias rfe='rake features'

alias v='vagrant'
alias vup='vagrant up'
alias vdown='vagrant halt'
alias vssh='/usr/local/bin/colored-vssh'

alias m.='mvim .'

alias a='ack'

function goto_project() {
  cd ~/dev/$1
}
alias cdp='goto_project'

function goto_project_and_up() {
  cd ~/dev/$1 && vup
}
alias pup='goto_project_and_up'

function goto_project_and_ssh() {
  cd ~/dev/$1 && vssh
}
alias pssh='goto_project_and_ssh'

alias pta='pt assign'
alias pts='pt start'
alias ptf='pt finish'
alias ptd='pt deliver'
alias ptw='pt show'

alias fp='filepath'

