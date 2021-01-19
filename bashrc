#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -la'

source /usr/share/bash-completion/bash_completion
source /usr/share/doc/pkgfile/command-not-found.bash

function parse_git_branch {
	branch="($(git branch 2>/dev/null | grep '^*' | colrm 1 2))"
	if [[ $branch == '()' ]];then
		echo ""
	else
		echo $branch
	fi 
}
function get_username {
	echo "\[\033[38;5;32m\]\u\[$(tput sgr0)\]"
}
function get_hostname {
	echo "\[\033[38;5;51m\]\h\[$(tput sgr0)\]"
}
function get_current_directory {
	echo "\[\033[38;5;33m\][\w]\[$(tput sgr0)\]"
}
function get_exit_code {
	exitstatus=$?
	if [[ $? != 0 ]];then
		echo exitstatus
	else
		echo ""
	fi
}

export PS1="$(get_username)@\[$(tput sgr0)\]$(get_hostname)$(get_current_directory)\[\033[38;5;100m\]\$(parse_git_branch)\[$(tput sgr0)\]\n> \[$(tput sgr0)\]"
shopt -s autocd
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
