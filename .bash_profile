# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
export PROMPT_COMMAND="pwd > /tmp/whereami"
export GDK_SCALE=1.73
export PATH="$HOME/.cargo/bin:$PATH"
export PATH=~/.npm-global/bin:$PATH
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/opt/python/libexec/bin:$PATH"
umask 002
eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

