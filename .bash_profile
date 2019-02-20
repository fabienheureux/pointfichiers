# .bash_profile

# Get the aliases and functions
[ -f $HOME/.bashrc ] && . $HOME/.bashrc
export PROMPT_COMMAND="pwd > /tmp/whereami"
export GDK_SCALE=1.73
export PATH="$HOME/.cargo/bin:$PATH"
export DOCKER_TLS_VERIFY="1"
export DOCKER_HOST="tcp://192.168.99.100:2376"
export DOCKER_CERT_PATH="/mnt/c/Users/fabie/.docker/machine/machines/default"
export DOCKER_MACHINE_NAME="default"
export COMPOSE_CONVERT_WINDOWS_PATHS="true"
export PATH="/home/linuxbrew/.linuxbrew/bin:$PATH"
umask 002
