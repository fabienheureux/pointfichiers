# . $HOME/.cargo/env
# set -x --universal fish_user_paths $fish_user_paths ~/.composer/vendor/bin

# set -x LANG en_US.utf-8
# set RUST_SRC_PATH /Users/lefrapperfabien/.rustup/toolchains/stable-x86_64-apple-darwin/lib/rustlib/src/rust/src

alias tmn "tmux new -s"
alias tma "tmux a -t"
alias tml "tmux ls"
alias config "/usr/bin/git --git-dir=$HOME/.pointfichiers/ --work-tree=$HOME"

alias v "nvim ."

alias gs "git status"
alias gl "git log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all"
alias gap "git add . -p"
alias gcp "git checkout . -p"
alias gcb "git checkout -b"

# Rust
alias rcm "rustc main.rs"

# ctags
alias ctg "ctags -R -f ./.tags ."
