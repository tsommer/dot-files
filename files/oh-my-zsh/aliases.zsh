alias gf='git fetch'
alias gr='git rebase'
alias gm='git merge'
alias ga='git add'
alias gd='git diff | mvim -R -f -'

alias rgm='ruby script/rails generate migration'

alias v='vagrant'
alias vup='vagrant up'
alias vdown='vagrant halt'
alias vssh='/usr/local/bin/colored-vssh'

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
