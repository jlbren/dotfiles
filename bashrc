#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
# Add color to ls 
alias ls='ls --color=auto'
PS1='[\u@\h \W]\$ '
# Arch: hook to search repos for missing command 
#source /usr/share/doc/pkgfile/command-not-found.bash
# Auto cd on entering path 
shopt -s autocd
# Alias for sourcing bashrc 
alias refresh='source ~/.bashrc'
# must press ctrl-D 2+1 times to exit shell
export IGNOREEOF="2"

# Tab completion settings
# Ignore caps
bind "set completion-ignore-case on"
# Allow fuzzy search for _ and - 
bind "set completion-map-case on"
# Show all matches if ambiguous 
bind "set show-all-if-ambiguous on"
# Color by file type when showing completions (uses LS_COLORS)
set colored-stats on 

#Better history stuff
# Append to the history file, don't overwrite it
shopt -s histappend
# Save multi-line commands as one command
shopt -s cmdhist
# Record each line as it gets issued
PROMPT_COMMAND='history -a'
# Make history size BIG, neglible performance overhead 
HISTSIZE=50000
HISTFILESIZE=10000
# Avoid duplicate entries
HISTCONTROL="erasedups:ignoreboth"
# Don't record insignificant commands
export HISTIGNORE="&:[ ]*:exit:ls:bg:fg:history"
# Useful timestamp format
HISTTIMEFORMAT='%F %T '
# cat multiline commands into one line in history file 
shopt -s cmdhist
# log commands immediately, not just on close (small overhead)
PROMPT_COMMAND='history -a'
# fix simple spelling errors for tab completion and cd
shopt -s dirspell
shopt -s cdspell

# extend cd path so that it looks in the home if not found in current
CDPATH=".:~/"

# Useful aliases.
# List whats taking up the most space.
alias diskhog="du -S | sort -n -r |more"
# Show me the size (sorted) of only the folders in this directory
alias folders="find . -maxdepth 1 -type d -print | xargs du -sk | sort -rn"
# ls aliases
alias ll='ls -l'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -laptr'  # oldest first sort
# cd into the old directory
alias bd='cd "$OLDPWD"'
# tail logs 
alias logs="find /var/log -type f -exec file {} \; | grep 'text' | cut -d' ' -f1 | sed -e's/:$//g' | grep -v '[0-9]$' | xargs tail -f"
# home dir 
alias home="/home/jon"
# functions! 
# go up n dirs 
up() { cd $(eval printf '../'%.0s {1..$1}) && pwd; }

psgrep() {
	if [ ! -z $1 ] ; then
		echo "Grepping for processes matching $1..."
		ps aux | grep $1 | grep -v grep
	else
		echo "!! Need name to grep for"
	fi
}

#set LS colors 
eval $(dircolors ~/.config/dircolors.txt)

