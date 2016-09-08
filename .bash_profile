# Enable tab completion
source ~/git-completion.bash
__git_complete gswitch _git_checkout
__git_complete gbranch _git_branch
__git_complete stash _git_stash

# colors!
gold="\[\033[0;33m\]"
green="\[\033[0;32m\]"
blue="\[\033[0;36m\]"
purple="\[\033[0;35m\]"
reset="\[\033[0m\]"

# Change command prompt
source ~/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=1
# '\u' adds the name of the current user to the prompt
# '\$(__git_ps1)' adds git-related stuff
# '\W' adds the name of the current directory
#export PS1="$purple\u$green\$(__git_ps1)$blue \W $ $reset "
# 'pwd' adds the name of the current directory, full path
if [ $HOSTNAME == 'farnsworth-neha' ]; then
    export PS1="$gold\u@\h$green\$(__git_ps1)$blue [\$(pwd)/] $ $reset \n$green[\t]$reset "
else
    export PS1="$purple\u@\h$green\$(__git_ps1)$blue [\$(pwd)/] $ $reset \n$green[\t]$reset "
fi
export PS1="$purple\u@\h$green\$(__git_ps1)$blue [\$(pwd)/] $ $reset \n$green[\t]$reset "
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
