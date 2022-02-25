# Aliases
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias python python3
alias pip pip3

# Linuxbrew
# eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Spacefish
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
alias config '/usr/bin/git --git-dir=/home/fabien/.pointfichiers/ --work-tree=/home/fabien'

# Node
fnm env | source

# Scaleway CLI autocomplete initialization.
eval (scw autocomplete script shell=fish)

# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end
