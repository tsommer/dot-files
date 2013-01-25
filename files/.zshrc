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

  $fg[white]Vim Reminders
  $reset_color--------------------------------------------------------------------------------------
  $fg[blue];                                        $reset_color|   $fg[blue]Ctrl-o
  $fg[cyan]  repeat last f/F search                 $reset_color|   $fg[cyan]  Enter insert-normal-mode
  $fg[blue]?<pattern>                               $reset_color|   $fg[blue]Ctrl-r<register>
  $fg[cyan]  search backwards (opp /)               $reset_color|   $fg[cyan]  paste in insert mode (= for expr)
  $fg[blue]Ctrl-a/Ctrl-x                            $reset_color|   $fg[blue]gv
  $fg[cyan]  increase/decrease number               $reset_color|   $fg[cyan]  reselect the last visual selection
  $fg[blue]gu/gU                                    $reset_color|   $fg[blue]o
  $fg[cyan]  change to lower-/uppercase             $reset_color|   $fg[cyan]  go to other end of visual selection
  $fg[cyan]  (guu/gUU for whole line)               $reset_color|   $fg[blue]Ctrl-v<motion>$
  $fg[blue]Ctrl-w/Ctrl-u                            $reset_color|   $fg[cyan]  extend block selec to end of line
  $fg[cyan]  delete last word/line (insert mode)    $reset_color|   $fg[blue]:<range><command>
 $fg[blue] :t / :m                                  $reset_color|   $fg[cyan]  ranges: % ; 2,4 ; /start/-1,/end/+1
  $fg[cyan]  copy / move line(s)                    $reset_color|   $fg[blue]q: / q/
  $fg[blue]                                         $reset_color|   $fg[cyan]  open history of commands / searches

  $fg[white]Git Reminders
  $reset_color--------------------------------------------------------------------------------------
  $fg[blue]gc --allow-empty                         $reset_color|   $fg[blue]g blame -w
  $fg[blue]g show :/query                           $reset_color|   $fg[cyan]  ignore whitespace
  $fg[blue]gco -                                    $reset_color|   $fg[blue]g blame -M
  $fg[cyan]  go back                                $reset_color|   $fg[cyan]  ignore moves within file
  $fg[blue]g branch --{no-}merged                   $reset_color|   $fg[blue]g blame -C
  $fg[blue]g branch --contains 12345678             $reset_color|   $fg[cyan]  ignore moves between files
  $fg[blue]gco master -- path/to/file               $reset_color|   $fg[blue]g diff --word-diff
  $fg[cyan]  copy file at master to local           $reset_color|   $fg[blue]g shortlog -sn
  $fg[blue]g log master ^stable                     $reset_color|   $fg[cyan]  contributions of committers
  $fg[cyan]  commits in master not in stable        $reset_color|

====================================================================================================
"
