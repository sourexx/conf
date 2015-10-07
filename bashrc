# Sample .bashrc by sourexx

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac


export PATH="$PATH:/usr/local/sbin:/usr/sbin:/sbin"
export EDITOR=/usr/bin/vim

#export HISTCONTROL=ignoreboth:erasedups
export HISTCONTROL=ignorespace
export HISTSIZE=10000
export HISTFILESIZE=1000000

# Save history on every command, update by request
alias u='history -n'
#alias u='history -r'
export PROMPT_COMMAND="history -a;"
#export PROMPT_COMMAND="history -w;"

# append to the history file, don't overwrite it
shopt -s histappend

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize


case "$TERM" in 
	xterm|xterm-color|screen|linux)
		color_prompt=yes
		;;
	*)
		;;
esac

if [ "$color_prompt" = "yes" ]; then
	#PS1='\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
        #PS1='\[\033[01;45;37m\] HEWLETT \[\033[00m\] \[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$ '
        PS1='\[\033[01;40;37m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]$ '
        alias ls='ls --color=auto'
	alias grep='grep --color=auto'
	alias fgrep='fgrep --color=auto'
	alias egrep='egrep --color=auto'

        # Less Colors for Man Pages
        export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
        export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
        export LESS_TERMCAP_me=$'\E[0m'           # end mode
        export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
        export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
        export LESS_TERMCAP_ue=$'\E[0m'           # end underline
        export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

else
	PS1='\u@\h:\w\$ '
fi

alias lg='ls -Fla --group-directories-first'
alias glog='for ref in $(git for-each-ref --sort=-committerdate --format="%(refname)" refs/heads/ refs/remotes ); do git log -n1 $ref --pretty=format:"%Cgreen%cr%Creset %C(yellow)%d%Creset %C(bold blue)<%an>%Creset%n" | cat ; done | awk "! a[$0]++A"'

# enable bash completion in interactive shells
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi


# Dircolors support
#
# Run this command first and edit as you like:
# dircolors -p > $HOME/.lscolors

eval "`dircolors -b $HOME/.lscolors`"

