# Enable tab completion
source ~/git-completion.bash

# colors!
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
export PS1="$purple\u$green\$(__git_ps1)$blue [\$(pwd)/] $ $reset \n$green[\t]$reset "
if [ -f ~/.bashrc ]; then . ~/.bashrc; fi
