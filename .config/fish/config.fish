##########
## TMUX ##
##########
alias tmn "tmux new -s"
alias tma "tmux a -t"
alias tml "tmux ls"

##############
## Dotfiles ##
##############
alias config "/usr/bin/git --git-dir=$HOME/.pointfichiers/ --work-tree=$HOME"

#########
## VIM ##
#########
alias v "nvim ."

#########
## Git ##
#########
alias gs "git status"
alias gl "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gap "git add . -p"
alias gcp "git checkout . -p"
alias gcb "git checkout -b"
alias gp "git push origin HEAD"

############
## Docker ##
############
alias dcu "docker-compose up"
alias dcs "docker-compose stop"
alias dck "docker-compose kill"

# Rust
alias rcm "rustc main.rs"

# ctags
alias ctg "ctags -R -f ./.tags ."

############
### Wing ###
############
alias wdbl "psql -h 127.0.0.1 -p 5432 -d postgres_sb -U postgres"

#############
### Shell ###
#############

alias l "ls -l"

###############
### Convert ###
###############
alias tocsv "libreoffice --headless --convert-to csv"
