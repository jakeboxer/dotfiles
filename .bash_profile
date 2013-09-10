### gh-setup ###
source /opt/boxen/env.sh

# Get the name of the current git branch
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

# Clean all files ending in .orig
function git-clean-orig {
  git status -su | grep -e"\.orig$" | cut -f2 -d" " | xargs rm
}

# Show all files ending in .orig
function git-show-orig {
  git status -su | grep -e"\.orig$" | cut -f2 -d" "
}

### ALIASES ###

# GitHub
alias gh='cd ~/github/github/'
alias ghh='cd ~/github/help/'
alias ght='cd ~/github/team/'

# Ruby
alias be='bundle exec'
alias ber='bundle exec rake'

### bash completion ###

if [ -f `brew --prefix`/etc/bash_completion ]; then
    . `brew --prefix`/etc/bash_completion
fi

# Fancy-Colors, GIT-Branch-Name and Success State of last command (with fancy utf8 symbols)
PS1="\[\e[1;37m\]\w\[\e[0;37m\]\`cmdRes=\$? && echo -en \"\$(__git_ps1) \" && if [ \$cmdRes = 0 ]; then echo -en '\[\e[1;32m\]✔ '; else echo -en '\[\e[1;31m\]✘ '; fi\`\[\e[1;37m\]\$ \[\e[m\]"
