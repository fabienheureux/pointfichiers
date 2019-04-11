packages:
	sudo apt install neovim git curl flatpak build-essential openssl libssl-dev
	# Install homebrew
	# curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh
	# test -d ~/.linuxbrew && eval $(~/.linuxbrew/bin/brew shellenv)
	# test -d /home/linuxbrew/.linuxbrew && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)
	# test -r ~/.bash_profile && echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.bash_profile
	# echo "eval \$($(brew --prefix)/bin/brew shellenv)" >>~/.profile

	# flatpak
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

python:
	brew install python
	brew install pipenv

node:
	curl -sL https://deb.nodesource.com/setup_11.x | sudo bash -
	sudo apt install nodejs
	mkdir ~/.npm-global

postgres:
	sudo touch /etc/apt/sources.list.d/pgdg.list
	sudo echo 'deb http://apt.postgresql.org/pub/repos/apt/ stretch-pgdg main' >> /etc/apt/sources.list.d/pgdg.list
	wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
	sudo apt update
	yes Y | sudo aptinstall postgresql-client-10

rust:
	curl https://sh.rustup.rs -sSf | sh

docker:
	sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose

apps:
	flatpak install flathub com.slack.slack
	flatpak install flathub org.blender.Blender

# Vim
vim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dir https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Dotfiles
dotfiles:
	git clone --bare https://github.com/fabienheureux/factcheck.git $HOME/.cfg
	mkdir -p .config-backup
	config checkout
	if [ $? = 0 ]; then
	  echo "Checked out config.";
	  else
	    echo "Backing up pre-existing dot files.";
	    config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | xargs -I{} mv {} .config-backup/{}
	fi;
	config checkout
	config config status.showUntrackedFiles no


# Setup github ssh key
github:
	rm -rf ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
	ssh-keygen -t rsa -b 4096 -C "contact@fabienlefrapper.me"
	ssh-add ~/.ssh/id_rsa
	pub=`cat ~/.ssh/id_rsa.pub`
	read -p "Enter github username: " githubuser
	echo "Using username $githubuser"
	curl -u "$githubuser" -X POST -d "{\"title\":\"`hostname`\",\"key\":\"$pub\"}" https://api.github.com/user/keys

# Setup gitlab ssh key
# curl -X POST -d "{\"title\": \"`hostname`\", \"key\": \"$pub\", \"id\":\"$githubuser\"}" https://gitlab.com/api/v4/users/:id/keys
