# ===================================================================================================
# Fear my .bashrc. It is mighty
# ===================================================================================================

# ---------------------------------------------------------------------------------------------------
# Stop! (collaborate, listen)
# Don't do any of the rest of this if this shell isn't interactive
# Scripts should configure their own environment, please.
# ---------------------------------------------------------------------------------------------------

if [ -s "$PS1" ]; then
  return
fi

# ---------------------------------------------------------------------------------------------------
# Create various directories that we would like everyhere
# ---------------------------------------------------------------------------------------------------
mkdir -p $HOME/tmp
mkdir -p $HOME/bin
mkdir -p $HOME/usr
mkdir -p $HOME/drop
mkdir -p $HOME/var


# ---------------------------------------------------------------------------------------------------
# Treat unset variables as errors, since they usually are Catastrophic ones
# if 'rm -rf' is involved
# ---------------------------------------------------------------------------------------------------

set -o nounset

# Source global definitions

if [ -f /etc/bashrc ]; then
        . /etc/bashrc
fi

alias h="history"

alias xterm="xterm -sb -sl 2000 -fg yellow -bg black -title `hostname` -e '/bin/bash' &"
alias ll="ls -la"

#export MY_HOME=""
export EDITOR=vi

 
# ---------------------------------------------------------------------------------------------------
# VNC Settings. 
# If for some unknown reason you're borrowing things from here change the :36 and :63 values, 
# ---------------------------------------------------------------------------------------------------

#alias runvnc1='vncserver -geometry 1280x1024 -depth 24 :36' #One monitor
#alias killvnc1='vncserver -kill :36'
#alias runvnc2='vncserver -geometry 1280x1024 -depth 24 :63' # Two monitors
#alias killvnc2='vncserver -kill :63'


# ---------------------------------------------------------------------------------------------------
# Check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS
# --------------------------------------------------------------------------------------------------

shopt -s checkwinsize


# ---------------------------------------------------------------------------------------------------
# Make less more friendly for non-text input files, see lesspipe(1)
# --------------------------------------------------------------------------------------------------

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a fancy prompt (non-colour, unless we know we "want" colour)
case "$TERM" in
	xterm-color) color_prompt=yes;;
esac

alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias lt='ls -ltr'
alias df='df -h'
alias du='du -h'



# GIT
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true


# ---------------------------------------------------------------------------------------------------
# Typos 
# ---------------------------------------------------------------------------------------------------

alias sl="ls"
alias exut="exit"
alias ks="ls"
alias chomd="chmod"



# ---------------------------------------------------------------------------------------------------
# GIT
# ---------------------------------------------------------------------------------------------------

# Git branch in prompt

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

export PS1="\u@\h \W\[\033[32m\]\$(parse_git_branch)[\033[00m\] $ "



# ---------------------------------------------------------------------------------------------------
# Scratch temp file
# ---------------------------------------------------------------------------------------------------
function scratch()
{
  local tmpfile= $(mktemp =p $TMP)
  vim $tmpfile
}





