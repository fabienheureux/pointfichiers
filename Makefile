homebrew:
	# Install homebrew
	curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh

rust:
	curl https://sh.rustup.rs -sSf | sh -s -- --help

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

docker:
	# install docker using convenience script
	# https://docs.docker.com/install/linux/docker-ce/ubuntu/
	curl -fsSL https://get.docker.com -o get-docker.sh
	sudo sh get-docker.sh
	# install docker compose
	sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	
	# Use docker without sudo
	sudo usermod -aG docker $(whoami)

linux-headless:
	make linux

linux-desktop:
	make linux
	# flatpak
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak install flathub com.slack.slack
	flatpak install flathub org.blender.Blender

vim:
	curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dir https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

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

github:
	rm -rf ~/.ssh/id_rsa ~/.ssh/id_rsa.pub
	ssh-keygen -t rsa -b 4096 -C "contact@fabienlefrapper.me"
	ssh-add ~/.ssh/id_rsa
	pub=`cat ~/.ssh/id_rsa.pub`
	read -p "Enter github username: " githubuser
	echo "Using username $githubuser"
	curl -u "$githubuser" -X POST -d "{\"title\":\"`hostname`\",\"key\":\"$pub\"}" https://api.github.com/user/keys

gitlab:
	# Setup gitlab ssh key
	# curl -X POST -d "{\"title\": \"`hostname`\", \"key\": \"$pub\", \"id\":\"$githubuser\"}" https://gitlab.com/api/v4/users/:id/keys	

shell:
	git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
	curl -fsSL https://starship.rs/install.sh | bash

macos:
	make shell
	make homebrew
	brew tap caskroom/versions
	brew install brew-cask
	brew cask install 1password docker google-chrome firefox virtualbox slack appcleaner entropy fantastical kap mactracker spectacle spotify teamviewer torbrowser viscosity vlc
	# cask quick look plugins (https://github.com/sindresorhus/quick-look-plugins)
	brew cask install qlcolorcode qlstephen qlmarkdown quicklook-json qlprettypatch quicklook-csv betterzipql suspicious-package
	# Install GNU core utilities (those that come with OS X are outdated) + some utils
	brew install coreutils dockutil mackup
	# Trackpad: enable tap to click for this user and for the login screen
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
	defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
	# Trackpad: map bottom right corner to right-click
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadCornerSecondaryClick -int 2
	defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadRightClick -bool true
	defaults -currentHost write NSGlobalDomain com.apple.trackpad.trackpadCornerClickBehavior -int 1
	defaults -currentHost write NSGlobalDomain com.apple.trackpad.enableSecondaryClick -bool true
	# Increase sound quality for Bluetooth headphones/headsets
	defaults write com.apple.BluetoothAudioAgent "Apple Bitpool Min (editable)" -int 40
	# Use scroll gesture with the Ctrl (^) modifier key to zoom
	defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
	defaults write com.apple.universalaccess HIDScrollZoomModifierMask -int 262144
	# Follow the keyboard focus while zoomed in
	defaults write com.apple.universalaccess closeViewZoomFollowsFocus -bool true
	# Set a blazingly fast keyboard repeat rate
	defaults write NSGlobalDomain KeyRepeat -int 1
	defaults write NSGlobalDomain InitialKeyRepeat -int 10
	# Show language menu in the top right corner of the boot screen
	sudo defaults write /Library/Preferences/com.apple.loginwindow showInputMenu -bool true
	# Finder: show all filename extensions
	defaults write NSGlobalDomain AppleShowAllExtensions -bool true
	# When performing a search, search the current folder by default
	defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"
	# Disable the warning when changing a file extension
	defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
	# Enable spring loading for directories
	defaults write NSGlobalDomain com.apple.springing.enabled -bool true
	# Remove the spring loading delay for directories
	defaults write NSGlobalDomain com.apple.springing.delay -float 0
	# Avoid creating .DS_Store files on network or USB volumes
	defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
	defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
	# Automatically open a new Finder window when a volume is mounted
	defaults write com.apple.frameworks.diskimages auto-open-ro-root -bool true
	defaults write com.apple.frameworks.diskimages auto-open-rw-root -bool true
	defaults write com.apple.finder OpenWindowForNewRemovableDisk -bool true
	# Use list view in all Finder windows by default
	# Four-letter codes for the other view modes: `icnv`, `clmv`, `Flwv`
	defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"
	# Disable the warning before emptying the Trash
	defaults write com.apple.finder WarnOnEmptyTrash -bool false
	# Enable AirDrop over Ethernet and on unsupported Macs running Lion
	defaults write com.apple.NetworkBrowser BrowseAllInterfaces -bool true
	# Show the ~/Library folder
	chflags nohidden ~/Library
	# Show the /Volumes folder
	sudo chflags nohidden /Volumes
	# Disable Dashboard
	defaults write com.apple.dashboard mcx-disabled -bool true
	# Don’t show Dashboard as a Space
	defaults write com.apple.dock dashboard-in-overlay -bool true
	# Don’t automatically rearrange Spaces based on most recent use
	defaults write com.apple.dock mru-spaces -bool false
	# Automatically hide and show the Dock
	defaults write com.apple.dock autohide -bool true
	# Make Dock icons of hidden applications translucent.
	defaults write com.apple.dock showhidden -bool true
	# Top left screen corner → Mission Control
	defaults write com.apple.dock wvous-tl-corner -int 10
	defaults write com.apple.dock wvous-tl-modifier -int 0
	# Top right screen corner → Desktop
	defaults write com.apple.dock wvous-tr-corner -int 2
	defaults write com.apple.dock wvous-tr-modifier -int 0
	# Bottom left screen corner → Start screen saver
	defaults write com.apple.dock wvous-bl-corner -int 4
	defaults write com.apple.dock wvous-bl-modifier -int 0V
	
linux:
	sudo apt-get update -y
	sudo apt-get install -y aptitude 
	sudo aptitude install -y neovim git curl flatpak build-essential openssl libssl-dev
	make shell
	make homebrew

dev:
	make rust
	make python
	make node
	make postgres
	make docker
	make github
