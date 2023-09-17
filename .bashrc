#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

export PATH="~/bin:$PATH"
# export PS1="[\u@\h \001\e[1;34m\002\w\001\e[m\002]\$ "
# colors
# \e[bold/italic/etc.;color30-37or90-97forlightm
# \001ESC\002 means the escape code doesn't have any width
# or use setaf isntead
if [[ $TERM = 'linux' || $TERM = 'alacritty' ]]; then
	green="\001\e[1;32m\002"
	blue="\001\e[1;34m\002"
else
	green="\001\e[0;92m\002"
	blue="\001\e[0;94m\002"
fi
reset="\001\e[0m\002"

PS1=""
PS1+="${green}["
PS1+="${green}\u@\h "	#current user@host
PS1+="${blue}\w" 	#current directory
PS1+="${green}]"
PS1+="${reset}\$ " 	# $ or # for sudo
#[user@host ~]$

export PS1
# export TRASH="$HOME/recycle_bin/"
export EDITOR="nvim"

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias vim='nvim'
# alias xd="toggle_cursor"
alias line='cd /home/vlad/workspace/html/line/master'
alias algo='cd /home/vlad/workspace/cpp/algorithms'
alias cpp='cd /home/vlad/workspace/cpp'
alias w3m_d='w3m duckduckgo.com'
