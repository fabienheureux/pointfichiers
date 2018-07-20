# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
export PROMPT_COMMAND="pwd > /tmp/whereami"
export GDK_SCALE=1.73
export PATH="$HOME/.cargo/bin:$PATH"
