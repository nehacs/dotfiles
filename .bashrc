# Command prompt is now being set in bash_profile
#export PS1="\[\033[0;36m\]\u@\h $ [\$(pwd)/]\[\033[0m\] \n\[\033[0;32m\][\t]\[\033[0m\] "
# To color for exit status of previous command, i.e. color for mistakes in red 
#PS1="\[\`if [[ \$? = "0" ]]; then echo '\e[32m\h\e[0m'; else echo '\e[31m\h\e[0m' ; fi\`:\w\n\$ "

export LSCOLORS=GxFxCxDxBxegedabagaced

# Path
export PATH=$PATH:$HOME/bin

# Bash history
export HISTCONTROL=ignoreboth
export HISTIGNORE="ls"

# Editor
export EDITOR="emacs"

# Aliases
alias ls="ls -alhG"
alias psgrep="ps -ef | grep "
alias more="less "

# Git aliases
alias gbranch="git branch "
alias gcheckout="git checkout "
alias gadd="git add "
alias grm="git rm "
alias gdiff="git diff "
alias gmv="git mv "
alias gstatus="git status "
alias gcommit="git commit -a "
alias gpush="git push "
alias gpull="git pull "
alias gce="gcommit; gpush "

# Macbook aliases
alias addspacer="defaults write com.apple.dock persistent-apps -array-add '{tile-data={}; tile-type="spacer-tile";}'; killall Dock"
alias showhidden="defaults write com.apple.finder AppleShowAllFiles YES; killAll Finder /System/Library/CoreServices/Finder.app"
alias hidehidden="defaults write com.apple.finder AppleShowAllFiles NO; killAll Finder /System/Library/CoreServices/Finder.app"

# Tmux aliases
alias tma="tmux attach-session -t "
alias tmn="tmux new-session -s "
alias tml="tmux list-sessions "
alias tmk="tmux kill-session -t "

# Functions
sshs() {
    scp bashrc_ssh $1:/tmp/.bashrc
    ssh -t $1 "zsh --rcs /tmp/.bashrc ; rm /tmp/.bashrc"
}

sshsi() {
    scp -i $1 bashrc_ssh $2:/home/admin/.bashrc
    ssh -i $1 $2
}

emd() {
    emacs --daemon
}

emstop() {
    emacsclient -e '(kill-emacs)'
}
