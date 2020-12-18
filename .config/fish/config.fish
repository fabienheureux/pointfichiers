# Base16 Shell
if status --is-interactive
    set BASE16_SHELL "$HOME/.config/base16-shell/"
    source "$BASE16_SHELL/profile_helper.fish"
end

# Aliases
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
alias python python3
alias pip pip3

# Linuxbrew
# eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# Spacefish
set -g fish_user_paths "/home/linuxbrew/.linuxbrew/bin" $fish_user_paths
set SPACEFISH_PROMPT_ORDER time user dir host pyenv git line_sep char
starship init fish | source
