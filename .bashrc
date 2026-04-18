# If not running interactively, don't do anything
[[ $- != *i* ]] && return

## Colors{{{
# \e[bold/italic/etc.;color30-37or90-97forlightm
# \001ESC\002 means the escape code doesn't have any width
# or use setaf instead
green="\001\e[0;92m\002"
blue="\001\e[0;94m\002"
reset="\001\e[0m\002"
if [[ $TERM == 'linux' ]]; then
        green="\001\e[1;32m\002"
        blue="\001\e[1;34m\002"
fi # }}}

# export PS1 # {{{
PS1=""
PS1+="${green}["
PS1+="${green}\u@\h "   #current user@host
PS1+="${blue}\w"        #current directory
PS1+="${green}]"
PS1+="${reset}\$ "      # $ or # for sudo
#[user@host ~]$
export PS1 # }}}

PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="~/bin:$PATH"
export EDITOR="nvim"

alias ls='ls --color=auto'
alias grep='grep --color=auto' # --exclude-dir={.git,node_modules}
alias w3m_d='w3m duckduckgo.com'

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin
export PATH=$PATH:$ANDROID_HOME/tools/bin

#export PATH=$HOME/.npm-global/bin:$PATH
source /usr/share/nvm/init-nvm.sh

#source "$HOME/.api_keys.sh"

# vi:fdm=marker

. "$HOME/.cargo/env"

# OpenClaw Completion
source "/home/vlad/.openclaw/completions/openclaw.bash"
