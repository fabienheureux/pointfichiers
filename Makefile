homebrew:
	./.scripts/homebrew.sh

rust:
	./.scripts/rust.sh

python:
	./.scripts/python.sh

postgres:
	./.scripts/postgres.sh

docker:
	./.scripts/docker.sh

linux-headless:
	make linux

brew-update:
	brew update
	brew upgrade

linux-update:
	sudo aptitude update
	sudo aptitude upgrade

docker-update:
	sudo docker-compose pull

server-update:
	make brew-update
	make linux-update
	make docker-update

linux-desktop:
	make linux
	# flatpak
	flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
	flatpak install flathub com.slack.slack
	flatpak install flathub org.blender.Blender

vim:
	./.scripts/vim.sh

dotfiles:
	git clone --bare https://github.com/fabienheureux/pointfichiers.git $HOME/.cfg
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
	

shell-linux:
	# Create a symbolic link to add kitty to PATH (assuming ~/.local/bin is in
	# your PATH)
	mkdir -p ~/.local/bin/
	ln -s ~/.local/kitty.app/bin/kitty ~/.local/bin/
	# Place the kitty.desktop file somewhere it can be found by the OS
	cp ~/.local/kitty.app/share/applications/kitty.desktop ~/.local/share/applications || true
	# Update the path to the kitty icon in the kitty.desktop file
	sed -i "s|Icon=kitty|Icon=/home/$USER/.local/kitty.app/share/icons/hicolor/256x256/apps/kitty.png|g" ~/.local/share/applications/kitty.desktop

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
	./.scripts/linux.sh
	make homebrew
	make shell

shell:
	./.scripts/shell.sh

node:
	./.scripts/node.sh

dev:
	./.scripts/dev.sh
