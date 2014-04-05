### boxen ###

source /opt/boxen/env.sh

### PATH STUFF ###

PATH=~/bin:$PATH

### ALIASES ###

# GitHub
alias gh='cd ~/github/github/'
alias ghh='cd ~/github/help/'
alias ght='cd ~/github/team/'
alias gh-console='ssh -t github-staff2-cp1-prd.iad.github.net gh-console'
alias gh-dbconsole='ssh -t github-staff2-cp1-prd.iad.github.net gh-dbconsole'
alias gh-ssh='ssh -t github-staff2-cp1-prd.iad.github.net'
alias gitsh="gitsh --git $(which hub)"

# Bundle/vendoring stuff
alias b="bundle"
alias bi="b install --path vendor"
alias bil="bi --local"
alias bu="b update"
alias be="b exec"
alias binit="bi && b package && echo 'vendor/ruby' >> .gitignore"

### bash completion ###

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Fancy-Colors and Success State of last command (with fancy utf8 symbols)
PS1="\[\e[1;37m\]\w\[\e[0;37m\] \`cmdRes=\$? && if [ \$cmdRes = 0 ]; then echo -en '\[\e[1;32m\]✔ '; else echo -en '\[\e[1;31m\]✘ '; fi\`\[\e[1;37m\]\$ \[\e[m\]"

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
