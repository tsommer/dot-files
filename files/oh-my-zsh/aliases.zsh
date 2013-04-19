alias g='hub'

function git-branch-name {
  git symbolic-ref HEAD | sed 's|.*/||'
}
alias gup='git fetch && git rebase -p origin/`git-branch-name`'

alias gst='g status -sb'
alias gf='g fetch'
alias gr='g rebase'
alias gm='g merge'
alias ga='g add'
alias gpo='gp origin'
alias gd='g diff | mvim -R -f -'
alias gcf='g clean -f'
alias grm='g rm'
alias gg='git log --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias gac='ga . && gc'
alias gash='g stash'
alias gashp='g stash pop'

alias rgm='ruby script/rails generate migration'

alias rsp='rake spec'
alias rcu='rake cucumber'
alias rfe='rake features'

alias v='vagrant'
alias vup='vagrant up'
alias vdown='vagrant halt'
alias vssh='/usr/local/bin/colored-vssh'

alias fs='foreman start'

alias m.='mvim .'

alias a='ack'

alias la='ls -al'
alias mcd='take'

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

alias psx='ps auxww'
alias dus='du -hs'

