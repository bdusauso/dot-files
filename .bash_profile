export EDITOR='vi'
export PATH=$PATH:~/bin

# Docker
# eval $(docker-machine env default)

# Selinko
export SELINKO_MAIN_DIR=~/devel/selinko/selinko-main
export GENESIS_CLI_VAULT_BUNDLE=~/devel/selinko/certificates/vault-bundle.pem
export GENESIS_CA_BUNDLE=~/devel/selinko/certificates/ca.cert.pem

### Common options
export CLICOLOR=1
export GRADLE_OPTS="-Xmx1024m"
export SBT_OPTS="-XX:MaxPermSize=256m"
export NODE_PATH=/usr/local/lib/node_modules
export ANDROID_HOME=~/Library/Android/sdk/
export PATH=$PATH:/usr/local/opt/go/libexec/bin
export PATH=$PATH:~/.asdf/bin

## Meeco CLI
export PATH=$PATH:~/programs/meeco/bin

if [ -f $(brew --prefix)/etc/bash_completion ]; then
   . $(brew --prefix)/etc/bash_completion
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)";fi

# Aliases
alias gs='git status '
alias ga='git add '
alias gb='git branch '
alias gc='git commit'
alias gd='git diff'
alias gl="git log --graph --pretty=format:'%C(yellow)%h%Creset%C(blue)%d%Creset %C(white bold)%s%Creset %C(white dim)(by %an %ar)%Creset'"
alias gb="git for-each-ref --format='%(refname:short)' refs/heads/* | while read b; do if r=$(git config --get branch.$b.remote); then m=$(git config --get branch.$b.merge); echo \"$b -> $r/${m##*/}\"; fi; done"

alias irbs='irb --simple-prompt'

alias bx='bundle exec'
alias bxrc='bundle exec rails console'
alias bxrk='bundle exec rake'
alias bxrr='bundle exec rails runner'
alias bxrs='bundle exec rails server'

# Docker helpers
alias dc="docker-compose"
complete -F _docker_compose dc
alias dcr='dc run --rm '
complete -F _docker_compose_run dcr
alias dcu='dc up'
complete -F _docker_compose_up dcu
alias dcrbtest='dcr -e RAILS_ENV=test '
alias dcmxtest='dcr -e MIX_ENV=test '
alias dps="docker ps --format='{{.Names}}' | sort"

# Bash completion (through Homebrew)
#if [ -f $(brew --prefix)/etc/bash_completion ]; then
#  echo 'Setting environment for Docker ...'
#  . $(brew --prefix)/etc/bash_completion
#fi

#alias dm="docker-machine"
#complete -F _docker-machine dm
#alias dmed='eval $(dm env default)'
#alias dmip='dm ip default'
#alias dmssh='dm ssh default'
#alias dmts='dmssh -- sudo date -s $(date -u "+%Y%m%d%H%M.%S")'
#alias dmdns='cat /etc/resolv.conf | dmssh -- sudo tee /etc/resolv.conf'

#machine_status=`dm status default`
#if [ $machine_status = Running ]; then
#  dmed
#fi

# Docker functions
function dcrbbxrc {
  dcr $1 bundle exec rails console
}

function dctrbbx {
  container=$1
  shift
  docker-compose run --rm -e RAILS_ENV=test $container bundle exec $*
}

function dcrbbx {
  container=$1
  shift
  docker-compose run --rm $container bundle exec $*
}

function dcexmx {
  container=$1
  shift
  docker-compose run --rm $container mix $*
}

function dctexmx {
  container=$1
  shift
  docker-compose run --rm -e MIX_ENV=test $container mix $* 
}

# Rename tabs and windows
function tabname {
  printf "\e]1;$1\a"
}
 
function winname {
  printf "\e]2;$1\a"
}

# Git branch in prompt
function parse_git_branch {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/ \(.*\)/ \(\1\)/'
}

PS1="\[\033[01;32m\]\u\[\033[01;33m\]@\[\033[01;31m\]\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m\] \[\033[01;35m\]\$(parse_git_branch)\[\033[00m\]\n\[\e[36m\]\t\[\e[m\] ➔  "

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
[[ -s "/Users/bdusauso/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/bdusauso/.sdkman/bin/sdkman-init.sh"

export HOMEBREW_GITHUB_API_TOKEN=9a27d84869d455c1af2f9d8ee74697074d4b1e4a

. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

export PATH="$HOME/.cargo/bin:$PATH"

export PATH="$HOME/.poetry/bin:$PATH"
