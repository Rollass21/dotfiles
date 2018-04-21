# Rolandkuv bash profilek

# Aliases
#-----------------

## shortcuts

### files, moving around, exec stuff
alias lsl='ls -lah'
alias l='ls '
alias la='ls -A'
alias cls='clear'
alias clsl='clear ;  ls -la'
alias search='grep --color'
alias grep="grep --color"
alias vi="vim"
alias editvim='vim ~/.vimrc'
alias editbash='vim ~/.bash_profile'
alias quit='exit'
alias restart="shutdown -r"

export PATH=$HOME/bin:$PATH

PREFS="~/.bash_profile ~/.vimrc ~/.gitignore_global ~/.git_message ~/.gitconfig" 
alias pushprefs="cp -uv $PREFS -t ~/prefs"

### apt
alias update='sudo apt-get update && sudo apt-get dist-upgrade && sudo apt autoremove ; echo -e "Update$DONE"'

# CLI settings
#-----------------

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
      . ~/.config/exercism/exercism_completion.bash
fi

# terminal looks & ease
#-----------------

shopt -s globstar

PS1='${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# function to change terminal title
function tit {
    if [ -z "$1" ]
    then
        title=${PWD##*/} # current directory
    else
        title=$1 # first param
    fi
    echo -n -e "\033]0;$title\007"
}

## color variables, tags
Color_Off="\033[0m"

Green="\033[0;32m"

DONE="$Green DONE $Color_off"
