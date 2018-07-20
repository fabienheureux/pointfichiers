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
alias cfap "config add . -p"
alias cfcm "config commit -m"
alias cfp "config push origin HEAD"

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
alias wdbp "psql -h destocking.cjik0xh2cbiu.eu-west-3.rds.amazonaws.com -p 5432 -d destocking -U wing"

#############
### Shell ###
#############

alias l "ls -l"

###############
### Convert ###
###############
alias tocsv "libreoffice --headless --convert-to csv"

##################
### Serverless ###
##################

# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/fabienheureux/.npm/_npx/8523/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /home/fabienheureux/.npm/_npx/8523/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /home/fabienheureux/.npm/_npx/8523/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /home/fabienheureux/.npm/_npx/8523/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish

################
### Postgres ###
################
alias pgstart "sudo runuser -l postgres -c 'pg_ctl -D /var/lib/postgres/data -l logfile start'"
alias pgstop "sudo runuser -l postgres -c 'pg_ctl -D /var/lib/postgres/data -l logfile stop'"

#############
#### Node ###
#############
alias nr "npm run"
alias ni "npm i"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /home/fabienheureux/Development/Clients/Wing/tms/packages/functions/node_modules/tabtab/.completions/serverless.fish ]; and . /home/fabienheureux/Development/Clients/Wing/tms/packages/functions/node_modules/tabtab/.completions/serverless.fish
