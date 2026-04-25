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

# ----- Aliases -----
alias ls='ls -alhG'
alias psgrep='ps -ef | grep '          # keep trailing space behavior
alias more='less '                     # keep trailing space behavior
alias mygrep='grep -r --exclude-dir={.idea,.git} --exclude=*tags'
alias rebash='clear; exec bash -l'
alias rezsh='clear; exec zsh -l'

# Git aliases
alias gbranch='git branch '
alias del='-d -D '                     # NOTE: this alias is dangerous/useless alone; see note below
alias gswitch='git checkout '
alias gcheckout='git checkout'
alias gpush='git push'
alias gpull='git pull'
alias gpullo='git pull origin master'
alias gadd='git add '
alias grm='git rm '
alias gdiff='git diff '
alias gmv='git mv '
alias gstatus='git status '
alias gcommit='git commit '
alias gcommitamend='git commit --amend '
alias gcommitne='git commit --amend --no-edit'
alias gsyncm='gswitch master; gpullo'
alias gsync='git rebase master'
alias gcurr='git rev-parse --abbrev-ref HEAD'
alias greb='git rebase '
alias grebcon='git rebase --continue '
alias gce='gcommit; gpush '
alias gshow='git show '
alias gfiles='git show --pretty="" --name-only'
alias greset='git fetch origin; git reset --hard origin/master'
alias stash='git stash '

# Gerrit aliases
alias grevrev='git review --reviewers '
alias grev='git review'
alias gdown='git review -d '

# Tmux aliases
alias tma="tmux -f ~/.tmux.conf attach-session -t "
alias tmn="tmux -f ~/.tmux.conf new-session -s "
alias tml="tmux -f ~/.tmux.conf list-sessions "
alias tmk="tmux -f ~/.tmux.conf kill-session -t "

# Macbook aliases
alias addspacer="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'; killall Dock"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles YES; killAll Finder /System/Library/CoreServices/Finder.app"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles NO; killAll Finder /System/Library/CoreServices/Finder.app"

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

precmd() { vcs_info }

USER_COLOR="%F{magenta}"

GIT_COLOR="%F{green}"
PATH_COLOR="%F{cyan}"
TIME_COLOR="%F{green}"
RESET="%f"

# Two-line prompt similar to your bash PS1:
# user@host + git + [pwd/] then newline with [time]
PROMPT='${USER_COLOR}%n@%m${GIT_COLOR}${vcs_info_msg_0_}'\
'${PATH_COLOR} [%/]/ $ ${RESET} 
${TIME_COLOR}[%*]${RESET} '
source ~/.okta/okta-login-shell-function

export PATH=/usr/local/go/bin:$PATH
# Created by `pipx` on 2026-01-28 22:58:26
export PATH="$PATH:/Users/neha/.local/bin"

# Claude Code skills directory
export CLAUDE_SKILLS_DIR=~/.claude/skills

bindkey -e
