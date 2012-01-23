# Get the name of the current git branch
function parse_git_branch {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ \1/'
}

# Fancy-Colors, GIT-Branch-Name and Success State of last command (with fancy utf8 symbols)
PS1="\[\e[1;37m\]\w\[\e[0;37m\]\`cmdRes=\$? && echo -en \"\$(__git_ps1) \" && if [ \$cmdRes = 0 ]; then echo -en '\[\e[1;32m\]✔ '; else echo -en '\[\e[1;31m\]✘ '; fi\`\[\e[1;37m\]\$ \[\e[m\]"

### ALIASES ###

# GitHub
alias gh='cd /Volumes/GitHub/github/'
alias gd='cd /Volumes/GitHub/docs/'

# Ruby
alias be='bundle exec'
alias ber='bundle exec rake'

### CINDERELLA ###

source /Users/jake/Developer/cinderella.profile
