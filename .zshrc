export SERVICES=/Users/ropeters/code/aurora
export EDITOR='emacs -nw'
export VIEW=elinks
export M2_HOME=/Users/ropeters/tools/maven-mp
export JAVA_HOME=`/usr/libexec/java_home`
export MAVEN_OPTS=-Xmx2g
export VOLDEMORT_HOME=/usr/local/Cellar/voldemort/0.81/libexec
export NODE_HOME=/usr/local/lib/node_modules
export NODE_PATH=$NODE_HOME
export PATH=/usr/local/mysql/bin:/usr/local/sbin:/usr/local/bin:$PATH
export PATH=$HOME/tools/maven-mp/bin:$PATH
export PATH=$HOME/code/cas/scripts:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/code/aurora/aurora-dev-tools/bin:$PATH
export PATH=$HOME/code/aurora/scripts:$PATH

alias sz='source ~/.zshrc'
alias ez='emacs ~/.zshrc'
alias gitk='gitx'
alias td='tmux detach'
alias ta='tmux attach -t default'
alias cas='cd ~/code/cas'
alias aurora='cd ~/code/aurora'
alias mci='mvn clean install -Denv=integration'
alias mcc='mvn clean compile'
alias gpr='git pull --rebase'
alias clojure='cd ~/code/personal/clojure'
alias mvnrelease='mvn -DautoVersionSubmodules=true release:prepare release:perform'
alias ll='ls -latr'

GRC=`which grc`
if [ "$TERM" != dumb ] && [ -n GRC ]
then
    alias colourify="$GRC -es --colour=auto"
    alias configure='colourify ./configure'
    alias diff='colourify diff'
    alias make='colourify make'
    alias gcc='colourify gcc'
    alias g++='colourify g++'
    alias as='colourify as'
    alias gas='colourify gas'
    alias ld='colourify ld'
    alias netstat='colourify netstat'
    alias ping='colourify ping'
    alias traceroute='colourify /usr/sbin/traceroute'
fi

# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git osx brew textmate dircycle dirpersist lein mvn)

source $ZSH/oh-my-zsh.sh

# from http://stackoverflow.com/questions/171563/whats-in-your-zshrc
# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# Now we can pipe to multiple outputs!
setopt MULTIOS

# Spell check commands!  (Sometimes annoying)
setopt CORRECT

# This makes cd=pushd
setopt AUTO_PUSHD

# This will use named dirs when possible
setopt AUTO_NAME_DIRS

# If we have a glob this will expand it
setopt GLOB_COMPLETE
setopt PUSHD_MINUS

# No more annoying pushd messages...
# setopt PUSHD_SILENT

# blank pushd goes to home
setopt PUSHD_TO_HOME

# this will ignore multiple directories for the stack.  Useful?  I dunno.
setopt PUSHD_IGNORE_DUPS

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

# use magic (this is default, but it can't hurt!)
setopt ZLE

# Autoload tmux if we aren't in it
[[ $TERM != "screen-256color" ]] && tmux attach -t default
#[[ $TERM != "screen" ]] && screen -ARR && exit

# URL encode something and print it.
function url-encode; {
        setopt extendedglob
        echo "${${(j: :)@}//(#b)(?)/%$[[##16]##${match[1]}]}"
}

# Search google for the given keywords.
function google; {
        $VIEW "http://www.google.com/search?q=`url-encode "${(j: :)@}"`"
}
