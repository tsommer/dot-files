RED="%{$fg[red]%}"
YELLOW="%{$fg[yellow]%}"
GREEN="%{$fg[green]%}"
BLUE="%{$fg[blue]%}"
CYAN="%{$fg[cyan]%}"
RESET="%{$reset_color%}"

ZSH_THEME_GIT_PROMPT_DIRTY="%{$RED%}●"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$YELLOW%}●"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$GREEN%}●"
ZSH_THEME_GIT_PROMPT_SHA_BEFORE="%{$BLUE%}"

function git_remote_status_with_counts() {
  remote=${$(git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}

  if [[ -n ${remote} ]] ; then
    ahead=$(git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
    behind=$(git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

    if [ $behind -gt 0 ]; then behind_count="%{$RED%}⤓${behind// /}"; fi
    if [ $ahead -gt 0 ]; then  ahead_count="%{$GREEN%}⤒${ahead// /}"; fi
    if [ $behind -gt 0 ] && [ $ahead -gt 0 ]; then separator=" "; fi

    if [ $behind -gt 0 ] || [ $ahead -gt 0 ]
    then
      echo "%{$RESET%}($behind_count$separator$ahead_count%{$RESET%})"
    else
      echo ""
    fi
  fi
}

function git_prompt() {
  echo "%{$YELLOW%}[$(current_branch)%{$RESET%}@$(git_prompt_short_sha)$(git_remote_status_with_counts) $(parse_git_dirty)%{$YELLOW%}]"
}

PROMPT='%{$CYAN%}%n%{$RESET%}@%{$CYAN%}%m %{$BLUE%}%c %{$CYAN%}➭ %{$RESET%} '
RPROMPT='$(git_prompt)%{$RESET%}'

# See http://geoff.greer.fm/lscolors/
export LSCOLORS="exfxcxdxbxbxbxbxbxbxbx"
export LS_COLORS="di=34;40:ln=35;40:so=32;40:pi=33;40:ex=31;40:bd=31;40:cd=31;40:su=31;40:sg=31;40:tw=31;40:ow=31;40:"

