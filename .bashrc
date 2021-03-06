# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

PATH="/home/aarkir/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/aarkir/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/aarkir/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/aarkir/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/aarkir/perl5"; export PERL_MM_OPT;

export PATH=$PATH:/home/aarkir/.cabal/bin/

export PATH=/usr/local/cuda-8.0/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda-8.0/lib64\${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}

alias Origin93="wine ~/.wine/drive_c/Program\ Files\ \(x86\)/OriginLab/Origin2016/Origin93.exe"

export PATH="$HOME/.linuxbrew/bin:$PATH"
export MANPATH="$HOME/.linuxbrew/share/man:$MANPATH"
export INFOPATH="$HOME/.linuxbrew/share/info:$INFOPATH"

export PATH=$PATH:/home/aarkir/software/phantomjs-2.1.1-linux-x86_64

export MANPATH=$MANPATH:/usr/local/texlive/2017/texmf-dist/doc/man
export INFOPATH=$INFOPATH:/usr/local/texlive/2017/texmf-dist/doc/info
export PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-linux

#export PATH=$PATH:"$HOME/anaconda2/bin"
export PATH=$PATH:"$HOME/anaconda3/bin"

export PATH=$PATH:"/usr/local/cuda-9.0/bin"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:"/usr/local/cuda-9.0/lib64"

bind 'set match-hidden-files on'
PS1='$ '
alias speak="spd-say done"
alias Fastai="cd ~/Desktop/courses/deeplearning1/nbs/"
export DEVICE="cuda"
export CUDA_ROOT="/usr/local/cuda"

export PATH=$PATH:"$HOME/software"

alias Xc="xclip -selection clipboard"

export EDITOR=vim

alias log-out="gnome-session-quit"

export PATH=$PATH:"/home/atkirtland/.local/bin"


function countdown(){
   date1=$((`date +%s` + $1)); 
   while [ "$date1" -ge `date +%s` ]; do 
     echo -ne "$(date -u --date @$(($date1 - `date +%s`)) +%H:%M:%S)\r";
     sleep 0.1
   done
   s
}

function unzd() {
    if [[ $# != 1 ]]; then echo I need a single argument, the name of the archive to extract; return 1; fi
    target="${1%.zip}"
    unzip "$1" -d "${target##*/}"
}

export -f unzd


export PATH=$PATH:"/home/aarkir/software/node-v8.7.0-linux-x64/bin"

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/atkirtland/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/atkirtland/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/atkirtland/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/atkirtland/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

alias cdvis='cd ~/Desktop/rips/rips2020afrl/visualizations'
alias cdquick2='cd ~/Desktop/rips/rips2020afrl/quick2'
alias oklang='okular ~/Desktop/todo/to-read/langtuteng.pdf'

# ffmpeg -i input_file.mp4 -acodec copy -vcodec copy -f mov output_file.mov

alias jpeg2jpg="find . -type f -name '*.jpeg' -print0 | xargs -0 rename 's/\.jpeg/\.jpg/'"
# https://github.com/hluk/CopyQ/issues/1181
export QT_IM_MODULE=ibus copyq
# can possibly use this for some greek chars with RIME, otherwise nothing pops up for xcompose
# https://wiki.archlinux.org/index.php/Fcitx5#RIME

# cse587
alias vimkindle="cp /media/atkirtland/Kindle/documents/My\ Clippings.txt ~/tmp/; vim ~/tmp/My\ Clippings.txt"
# alias Mathematica="bash /usr/local/Wolfram/Mathematica/12.0/Executables/mathematica"
export PATH=$PATH:/usr/local/Wolfram/Mathematica/12.0/Executables
export PATH=$PATH:/home/atkirtland/eclipse/java-2020-06/eclipse
export PATH=$PATH:/usr/local/MATLAB/R2020a/bin

alias VimLatexHeader="sudo vim /usr/share/texmf/tex/latex/latex-header"
# sudo texhash

# make tab cycle through commands after listing
bind '"\t":menu-complete'
bind "set show-all-if-ambiguous on"
bind "set completion-ignore-case on"
bind "set menu-complete-display-prefix on"

alias cppwd="pwd | xclip -selection clipboard"

alias Latexhere='nohup latexmk -pvc & okular main.pdf; vim main.tex'

export PATH=$PATH:/home/atkirtland/software/tinker/bin
export PATH=$PATH:/home/atkirtland/MGLTools-1.5.7rc1/bin

