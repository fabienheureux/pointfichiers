# Aliases
alias config '/usr/bin/git --git-dir=/home/fabien/.pointfichiers/ --work-tree=/home/fabien'
# alias pytho python3
# alias pip pip3
alias penv '. .venv/bin/activate.fish'
alias spp-env-install '. .venv/bin/activate.fish'
alias sppis 'python manage.py runserver'
alias sppt 'pytest unit_tests/'
alias spp-env-install 'pip install -r PDFGenerator/http/requirements.txt -r PDFGenerator/http/dev-requirements.txt'
alias sppi-test 'pytest unit_tests/'
alias spp-test 'pytest PDFGenerator/http/unit_tests/'
alias spp-test-inte 'docker-compose build; pytest integration_tests/'
alias spp-test-watch 'git ls-files| entr -c pytest -m "not slow" unit_tests/'

# Docker
alias ds 'docker-compose up -d'

# Django
alias djs 'python manage.py runserver'

# Scaleway CLI autocomplete initialization.
# eval (scw autocomplete script shell=fish)


# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/fabienlefrapper/Downloads/google-cloud-sdk/path.fish.inc' ]; . '/Users/fabienlefrapper/Downloads/google-cloud-sdk/path.fish.inc'; end

starship init fish | source

set -x PATH ~/.local/bin $PATH

# pnpm
set -gx PNPM_HOME "/Users/fabienlefrapper/Library/pnpm"
set -gx PATH "$PNPM_HOME" $PATH
# pnpm end
source /Users/fabienlefrapper/.docker/init-fish.sh || true # Added by Docker Desktop

source /opt/homebrew/opt/asdf/libexec/asdf.fish

set -gx  LC_ALL en_US.UTF-8
set -gx PATH "$HOME/.cargo/bin" $PATH
