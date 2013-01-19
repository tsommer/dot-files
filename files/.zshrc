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

  $fg[white]Vim Reminders                            $reset_color|   $fg[white]Git Reminders
  $reset_color--------------------------------------------------------------------------------------
  $fg[blue];                                        $reset_color|   $fg[blue]gc --allow-empty
  $fg[cyan]  repeat last f/F search                 $reset_color|   $fg[blue]g show :/query
  $fg[blue]?<pattern>                               $reset_color|   $fg[blue]gco -
  $fg[cyan]  search backwards (opp /)               $reset_color|   $fg[cyan]  go back
  $fg[blue]Ctrl-a/Ctrl-x                            $reset_color|   $fg[blue]g branch --{no-}merged
  $fg[cyan]  increase/decrease number               $reset_color|   $fg[blue]g branch --contains 12345678
  $fg[blue]gu/gU                                    $reset_color|   $fg[blue]gco master -- path/to/file
  $fg[cyan]  change to lower-/uppercase             $reset_color|   $fg[cyan]  copies file at master w/o switching branches
  $fg[cyan]  (guu/gUU for whole line)               $reset_color|   $fg[blue]g log master ^stable
  $fg[blue]Ctrl-w/Ctrl-u                            $reset_color|   $fg[cyan]  commits in master that aren't in stable
  $fg[cyan]  delete last word/line (insert mode)    $reset_color|   $fg[blue]g blame -w
  $fg[blue]Ctrl-o                                   $reset_color|   $fg[cyan]  ignore whitespace
  $fg[cyan]  Enter insert-normal-mode               $reset_color|   $fg[blue]g blame -M
  $fg[blue]Ctrl-r<register>                         $reset_color|   $fg[cyan]  ignore moves within file
  $fg[cyan]  paste in insert mode (= for expr)      $reset_color|   $fg[blue]g blame -C
  $fg[blue]gv                                       $reset_color|   $fg[cyan]  ignore moves between files in same commit
  $fg[cyan]  reselect the last visual selection     $reset_color|   $fg[blue]g diff --word-diff
  $fg[blue]o                                        $reset_color|   $fg[blue]g shortlog -sn
  $fg[cyan]  go to other end of visual selection    $reset_color|   $fg[cyan]  contributions of committers
  $fg[blue]Ctrl-v<motion>$                          $reset_color|
  $fg[cyan]  extend block selec to end of line      $reset_color|


====================================================================================================
"
