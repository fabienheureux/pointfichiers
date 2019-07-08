# Base16 Shell
set BASE16_SHELL "$HOME/.config/base16-shell/"
[ -n "$PS1" ]; and \
[ -s "$BASE16_SHELL/profile_helper.sh" ]; and \
eval "("$BASE16_SHELL/profile_helper.sh")"

# Aliases
alias config '/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# Linuxbrew
eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)

# NPM 
set PATH ~/.npm-global $PATH

umask 002

# Spacefish
set SPACEFISH_PROMPT_ORDER time user dir host pyenv git line_sep char
