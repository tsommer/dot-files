alias gf='git fetch'
alias gr='git rebase'
alias gm='git merge'
alias ga='git add'
alias gd='git diff | mate'

alias rgm='ruby script/rails generate migration'

alias vup='vagrant up'
alias vdown='vagrant halt'
alias vssh='vagrant ssh'

function goto_project_and_up() {
  cd ~/dev/$1 && vup
}
alias pup='goto_project_and_up'

function goto_project_and_ssh() {
  cd ~/dev/$1 && vssh
}
alias pssh='goto_project_and_ssh'
