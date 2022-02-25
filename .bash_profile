# .bash_profile

# Get the aliases and functions
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

export PATH=~/.npm-global/bin:$PATH
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
export PATH="/home/linuxbrew/.linuxbrew/opt/python/libexec/bin:$PATH"
umask 002

export PATH="$HOME/.poetry/bin:$PATH"
. "$HOME/.cargo/env"
