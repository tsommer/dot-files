# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.oh-my-zsh

# Set to the name theme to load.
# Look in ~/.oh-my-zsh/themes/
export ZSH_THEME="arrow2"

# Set to this to use case-sensitive completion
# export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(bundler gem git rails3 vi-mode history-substring-search)

source $ZSH/oh-my-zsh.sh
source ~/.dot-files/zsh-history-substring-search/zsh-history-substring-search.zsh

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/usr/X11/bin
export EDITOR=vim

# lets you search for running processes
any() {
    emulate -L zsh
    unsetopt KSH_ARRAYS
    if [[ -z "$1" ]] ; then
        echo "any - grep for process(es) by keyword" >&2
        echo "Usage: any " >&2 ; return 1
    else
        ps xauwww | grep -i --color=auto "[${1[1]}]${1[2,-1]}"
    fi
}

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Start in project folder when possible
if [ -d "/vagrant" ]; then
  cd /vagrant
fi

# Reminder about some git tricks
echo "
====================================================================================================

  $fg[cyan] Git Reminders
  $reset_color---------------
  $fg[cyan] gc --allow-empty
  $fg[cyan] g show :/query
  $fg[cyan] gco -                       $reset_color go back
  $fg[cyan] g branch --{no-}merged
  $fg[cyan] g branch --contains 12345678
  $fg[cyan] gco master -- path/to/file  $reset_color copies file at master w/o switching branches
  $fg[cyan] g log master ^stable        $reset_color commits in master that aren't in stable
  $fg[cyan] g blame -w                  $reset_color ignore whitespace
  $fg[cyan] g blame -M                  $reset_color ignore moves within file
  $fg[cyan] g blame -C                  $reset_color ignore moves between files in same commit
  $fg[cyan] g diff --word-diff
  $fg[cyan] g shortlog -sn              $reset_color contributions of committers

  $fg[cyan] Vim Reminders
  $reset_color---------------
  $fg[cyan] ;                           $reset_color repeat last f/F search (, to go back)
  $fg[cyan] ?<pattern>                  $reset_color search backwards (opposite /)
  $fg[cyan] Ctrl-a / Ctrl-x             $reset_color increase / decrease next number
  $fg[cyan] gu / gU                     $reset_color change to lower- / uppercase (guu / gUU in whole line)

====================================================================================================
"
