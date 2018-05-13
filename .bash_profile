# Rolandkuv bash profilek

# Aliases
#-----------------

## shortcuts
EDITOR='vim'

### files, moving around, exec stuff
alias lsl='ls -lah'
alias l='ls '
alias la='ls -A'
alias cls='clear'
alias clsl="clear ; la"
alias search='grep --color'
alias grep="grep --color"
alias vi="vim"
alias editvim="$EDITOR ~/.vimrc"
alias editbash="$EDITOR ~/.bash_profile"
alias editgit="$EDITOR ~/.gitconfig"
alias quit='exit'
alias restart="shutdown -r"
ncores="$(grep '^processor' /proc/cpuinfo | wc -l)"
alias mk="make -j$ncores"
alias mkc="mk check && mk syntax-check"

export PATH=$HOME/bin:$PATH

PREFS="~/.bash_profile ~/.vimrc ~/.gitignore_global ~/.git_message ~/.gitconfig" 
alias pushprefs="cp -v $PREFS -t ~/dotfiles"

alias update="sudo dnf update -y"
# CLI settings
#-----------------

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
      . ~/.config/exercism/exercism_completion.bash
fi

# terminal looks & ease
#-----------------

shopt -s globstar

PS1='---END---\n${debian_chroot:+($debian_chroot)}\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
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
