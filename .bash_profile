# Rolandkuv bash profilek

# Functions
#-----------------

get_path() {
    SOURCE="${BASH_SOURCE[0]}"
    while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
        DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
        SOURCE="$(readlink "$SOURCE")"
        [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
    done
    DIR="$( cd -P "$( dirname "$SOURCE" )" >/dev/null 2>&1 && pwd )"
    local retval=$SOURCE
    echo "$retval"
}

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# Aliases
#-----------------

## shortcuts
export EDITOR=vim
export VISUAL="$EDITOR"

### files, moving around, exec stuff
alias lsl='ls -lah'
alias l='ls '
alias la='ls -A'
alias cls='clear'
alias clsl="clear ; la"
alias search='grep --color'
alias grep="grep --color"
alias vim='nvim'
alias vi="nvim"
alias v="nvim"
alias jlab="jupyter-lab"
alias editvim="$EDITOR ~/.vimrc"
alias editbash="$EDITOR ~/.bash_profile"
alias editgit="$EDITOR ~/.gitconfig"
alias quit='exit'
alias restart="shutdown -r"
ncores="$(grep '^processor' /proc/cpuinfo | wc -l)"
alias mk="make -j$ncores"
alias mkc="mk check && mk syntax-check"
alias cpdir="cp -r"
bashrcpath=$(get_path)
alias aliases='cat $bashrcpath | grep alias | cut -c 7-'

export PATH=$HOME/bin:$HOME/bin/SASM:$HOME/bin/scripts:$HOME/bin/SASM:$PATH
# CLI settings
#-----------------

if [ -f ~/.config/exercism/exercism_completion.bash ]; then
      . ~/.config/exercism/exercism_completion.bash
fi

# terminal looks & ease
#-----------------

# glob ** is now recursive *
shopt -s globstar
# automatically cd into folder by just typing its path
#shopt -s autocd
# fix spelling errors for cd, only in interactive shell
shopt -s cdspell
# multiline commands as one entry in history
shopt -s cmdhist

gb() {
            echo -n '(' && git branch 2>/dev/null | grep '^*' | colrm 1 2 | tr -d '\n' && echo  -n ')'
}
git_branch() {
            gb | sed 's/()//'
}

# without time HH:MM
#PS1='\[\033[01;35m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '

# with time HH:MM
PS1='[\A]\[\033[01;35m\]\u@\h\[\033[00m\]:$(git_branch)\w\$ ' 
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# man pages colors
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'

# for the memes
fortune | cowsay
