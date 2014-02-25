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
export PATH=$PATH:$HOME/.rvm/bin

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
  $fg[blue];undol                                   $reset_color|    $fg[blue];undo #
  $fg[cyan]  Show undo list                         $reset_color|    $fg[cyan]  Change to state # from undo list
  $fg[blue]g+ / g-                                  $reset_color|    $fg[blue];m9
  $fg[cyan]  Move forward / backward in undo list   $reset_color|    $fg[cyan]  Move line of cursor to line 9
  $fg[blue];1:10 w( >>) file.txt                    $reset_color|    $fg[blue]<number>Ctrl-a / Ctrl-x
  $fg[cyan]  Write (append) lines 1-10 to file.txt  $reset_color|    $fg[cyan]  Increase / Decrease by number
  $fg[blue]Cmd-d                                    $reset_color|    $fg[blue]cx<motion> and cx<motion>
  $fg[cyan]  Close other tabs                       $reset_color|    $fg[cyan]  Exchange texts

  $fg[white]Shell Reminders
  $reset_color--------------------------------------------------------------------------------------
  $fg[blue]massren
  $fg[cyan]  Rename multiple files

  $fg[white]Alfred Reminders
  $reset_color--------------------------------------------------------------------------------------
  $fg[blue]dash css:background
  $fg[cyan]  Open documentation

$reset_color====================================================================================================
"

