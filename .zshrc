# ----- Completion -----
autoload -Uz compinit
compinit

# ----- History (bash HISTCONTROL=ignoreboth, HISTIGNORE="ls") -----
HISTFILE=~/.zsh_history
HISTSIZE=100000
SAVEHIST=100000

# ignoreboth ~= ignore duplicates + ignore commands beginning with space
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE

# Rough equivalent of HISTIGNORE="ls"
# (matches `ls` and `ls ...`; if you want ONLY exact `ls`, tell me and I’ll tighten it)
HISTORY_IGNORE="(ls|ls * )"

# ----- General aliases -----
alias ls='ls -alhG'
alias psgrep='ps -ef | grep '          # keep trailing space behavior
alias more='less '                     # keep trailing space behavior
alias mygrep='grep -r --exclude-dir={.idea,.git} --exclude=*tags'
alias rebash='clear; exec bash -l'
alias rezsh='clear; exec zsh -l'

# ----- Tmux aliases -----
alias tma="tmux -f ~/.tmux.conf attach-session -t "
alias tmn="tmux -f ~/.tmux.conf new-session -s "
alias tml="tmux -f ~/.tmux.conf list-sessions "
alias tmk="tmux -f ~/.tmux.conf kill-session -t "

# ----- Macbook aliases -----
alias addspacer="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'; killall Dock"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles YES; killAll Finder /System/Library/CoreServices/Finder.app"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles NO; killAll Finder /System/Library/CoreServices/Finder.app"

# ============================================================================
# Git aliases
# ============================================================================
# $HEAD          - default branch of the current repo (main or master)
# $GIT_WORKFLOW  - "gerrit" if repo has a .gitreview file, else "github"
# Both are recomputed before every prompt by precmd().
# ============================================================================

# ----- Git: always-on aliases (mode-independent) -----
alias gbranch='git branch '
alias del='-d -D '                     # used as: gbranch del <branch-name>
alias gswitch='git checkout '
alias gcheckout='git checkout'
alias gpush='git push'
alias gpull='git pull'
alias gadd='git add '
alias grm='git rm '
alias gdiff='git diff '
alias gmv='git mv '
alias gstatus='git status '
alias gcommit='git commit '
alias gcommitamend='git commit --amend '
alias gcommitne='git commit --amend --no-edit'
alias gcurr='git rev-parse --abbrev-ref HEAD'
alias greb='git rebase '
alias grebcon='git rebase --continue '
alias gshow='git show '
alias gfiles='git show --pretty="" --name-only'
alias stash='git stash '

# ----- Git: workflow-aware aliases (use $HEAD set per-repo by precmd) -----
alias gpullo='git pull origin $HEAD'
alias gsyncm='gswitch $HEAD; gpullo'
alias gsync='git rebase $HEAD'
alias greset='git fetch origin; git reset --hard origin/$HEAD'

# ----- Gerrit aliases (harmless in github repos: git review just errors out) -----
alias grev='git review'
alias grevrev='git review --reviewers '
alias gdown='git review -d '

# gce: commit + submit. Submission method depends on $GIT_WORKFLOW.
# unalias guards against re-sourcing this file in a shell that already has gce
# defined as an alias (alias expansion would otherwise mangle the function def).
unalias gce 2>/dev/null
function gce {
  git commit "$@" || return $?
  if [[ "$GIT_WORKFLOW" == "gerrit" ]]; then
    git review
  else
    git push
  fi
}

# ----- Prompt: git branch + dirty state (zsh-native) -----
autoload -Uz vcs_info
setopt PROMPT_SUBST

zstyle ':vcs_info:*' enable git
# markers for staged/unstaged
zstyle ':vcs_info:git:*' stagedstr '+'
zstyle ':vcs_info:git:*' unstagedstr '*'
# show branch and markers
zstyle ':vcs_info:git:*' formats ' (%b%u%c)'
zstyle ':vcs_info:git:*' actionformats ' (%b|%a%u%c)'

# Recompute $HEAD and $GIT_WORKFLOW for the current repo on every prompt.
precmd() {
  vcs_info

  # Default branch: prefer origin/HEAD, fall back to probing main/master.
  HEAD=$(git symbolic-ref --short refs/remotes/origin/HEAD 2>/dev/null | sed 's@^origin/@@')
  if [[ -z "$HEAD" ]]; then
    if   git show-ref --verify --quiet refs/remotes/origin/main   2>/dev/null; then HEAD=main
    elif git show-ref --verify --quiet refs/remotes/origin/master 2>/dev/null; then HEAD=master
    fi
  fi

  # Workflow: gerrit if .gitreview is present at repo root, else github.
  local _top
  _top=$(git rev-parse --show-toplevel 2>/dev/null)
  if [[ -n "$_top" && -f "$_top/.gitreview" ]]; then
    GIT_WORKFLOW=gerrit
  elif [[ -n "$_top" ]]; then
    GIT_WORKFLOW=github
  else
    GIT_WORKFLOW=
  fi
}

USER_COLOR="%F{magenta}"
GIT_COLOR="%F{green}"
PATH_COLOR="%F{cyan}"
TIME_COLOR="%F{green}"
MODE_COLOR="%F{yellow}"
RESET="%f"

# Two-line prompt: user@host + git + [workflow] + [pwd/] then newline with [time]
PROMPT='${USER_COLOR}%n@%m${GIT_COLOR}${vcs_info_msg_0_}${MODE_COLOR}${GIT_WORKFLOW:+ [$GIT_WORKFLOW]}'\
'${PATH_COLOR} [%/]/ $ ${RESET} 
${TIME_COLOR}[%*]${RESET} '
source ~/.okta/okta-login-shell-function

export PATH=/usr/local/go/bin:$PATH
# Created by `pipx` on 2026-01-28 22:58:26
export PATH="$PATH:/Users/neha/.local/bin"

# Claude Code skills directory
export CLAUDE_SKILLS_DIR=~/.claude/skills

bindkey -e
