# some more ls aliases
### files, moving around, exec stuff
alias l='ls -CF'
alias ll='ls -alF'
alias lsl='ls -lah'
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
ncores="$(grep '^processor' /proc/cpuinfo | wc -l)"
alias mk="make -j$ncores"
alias mkc="mk check && mk syntax-check"
alias cpdir="cp -r"
alias pip=pip3
