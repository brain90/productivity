# Remote 
alias st="ssh brain@some-machine -v"

# Database
alias d='psql -U some_users -h dev some_db -p 5433'

# Utility
alias ssu="sudo su"
alias py="python"
alias c="cd"
alias cls="clear"
alias v="vim"
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -hlt'
alias g='git'
alias p="cd /home/brain/Documents/Projects/"
#--- todo list management using damn simple tools http://stevelosh.com/projects/t/
alias t='python ~/Documents/Software/todot/t.py --task-dir ~/tasks --list tasks'
alias wget="wget --no-proxy"
alias gl='git log --pretty=format:"%ar -> %s"' 
alias gf='git diff-tree --no-commit-id --name-only -r $1'
alias gs='git show --pretty="format:" --name-only'
alias pomo='java -jar /home/brain/Documents/Software/tomighty-0.7.1.jar &> /tmp/pomo.log &'
alias td='tmuxifier w ~/brainmux.sh'
alias m='mocp'
alias lirik='clyrics -m -s 3'

# Enable Ctrl + S in vim 
bind -r '\C-s'
stty -ixon

# PATH
export PATH=$HOME/Documents/Software/firefox/:$PATH
export PATH=$PATH:/usr/local/go/bin
