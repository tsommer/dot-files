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
plugins=(bundler gem git rails3 history-substring-search)

source $ZSH/oh-my-zsh.sh
source ~/.dot-files/zsh-history-substring-search/zsh-history-substring-search.zsh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/local/sbin:/usr/local/git/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
export EDITOR="mvim -f"

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
  $fg[blue]Ctrl-] / Ctrl-t                          $reset_color|  $fg[blue] :tag method_name             
  $fg[cyan]  Drill down / up within tags            $reset_color|   $fg[cyan]  Look up method_name in tags 
  $fg[blue]var / vir                                $reset_color|   $fg[blue]ar / ir
  $fg[cyan]  Select outside / inside ruby block     $reset_color|   $fg[cyan]  Drill down / up in selected ruby block

  $fg[white]Git Reminders
  $reset_color--------------------------------------------------------------------------------------
  $fg[blue]gc --allow-empty                         $reset_color|   $fg[blue]g diff --word-diff

$reset_color====================================================================================================
"

