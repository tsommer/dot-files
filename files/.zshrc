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
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/X11/bin
export EDITOR=vim

# Load RVM into the shell session and add rvm to PATH
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
PATH=$PATH:$HOME/.rvm/bin

# Load boxen env
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh

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

# Start in project folder when possible
if [ -d "/vagrant" ]; then
  cd /vagrant
fi

# Reminder about some git tricks
echo "
$reset_color====================================================================================================

  $fg[white]Vim Reminders
  $reset_color--------------------------------------------------------------------------------------
  $fg[blue]gu/gU | guu/gUU                          $reset_color|   $fg[blue]q: / q/
  $fg[cyan]  change word/line to lower-/uppercase   $reset_color|   $fg[cyan]  open history of commands / searches
  $fg[blue]:R                                       $reset_color|   $fg[blue]o
  $fg[cyan]  Switch between app file and spec       $reset_color|   $fg[cyan]  go to other end of visual selection
 $fg[blue] :ls, [b, ]b, :b8, :bd                    $reset_color|   $fg[blue]:bufdo / :args
 $fg[blue] :args *.txt                              $reset_color|   $fg[cyan]  execute command on all buffers, args
  $fg[cyan]  Populate args list                     $reset_color|   $fg[blue]Crtl-w-s / Ctrl-w-w / ;c
  $fg[blue]                                         $reset_color|   $fg[cyan]  Split / Cycle / Close

  $fg[white]Git Reminders
  $reset_color--------------------------------------------------------------------------------------
  $fg[blue]gc --allow-empty                         $reset_color|   $fg[blue]g show :/query
  $fg[blue]gco master -- path/to/file               $reset_color|   $fg[blue]g diff --word-diff
  $fg[cyan]  copy file at master to local           $reset_color|

  $fg[white]Aliases
  $reset_color--------------------------------------------------------------------------------------
  $fg[blue]psx                                      $reset_color|   $fg[blue]dus

$reset_color====================================================================================================
"

