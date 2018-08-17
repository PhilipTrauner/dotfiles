#!/usr/local/bin/bash

set -e

. utils.sh

ask_details

TAPS=("homebrew/cask-fonts" "homebrew/cask-versions" "homebrew/cask-drivers" "homebrew/cask-fonts")

FORMULAS=("bash" "cmake" "cmus" "coreutils" "curl" "direnv" "ffmpeg" "git" "git-lfs" \
	"grep" "htop" "imagemagick" "jq" "make" "mas" "md5sha1sum" "ncurses" "neofetch" \
	"nmap" "node" "p7zip" "pipenv" "python3" "python@2" "rsync" "screenfetch" \
	"ssh-copy-id" "tree" "unrar" "watch" "wget" "wireguard-tools" "yarn" "zsh")
DEFAULT_NAME_FORMULAS=("gnu-sed" "make" "grep" "gnu-indent" "gnu-tar" "findutils")

CASKS=("airfoil" "appcleaner" "bartender" "blockblock" "dropbox" "etcher" "filezilla" \
	"font-source-code-pro" "google-chrome" "google-chrome-canary" "hyperdock" "iterm2" \
	"knockknock" "lingon-x5 " "quicklook-json" "sensiblesidebuttons" "spectacle" "spotify" \
	"spotify-notifications" "sublime-text-dev" "transmission" "typora" \
	"virtualbox" "virtualbox-extension-pack" "vlc" "wireshark")

# Pixelmator, Keynote, Pages, Numbers, Xcode, Amphetamine
MAS=("407963104" "409183694" "409201541" "409203825" "497799835" "937984704")

# Prevent sleep
caffeinate -i -w $$ &

# Create default directory tree
mkdir -p ~/Developer/scripts ~/Developer/clones ~/Developer/testing

# Install Developer tools
until ! xcode-select --install 2> /dev/null ; do
	sleep 2
done

# Install brew
if [ ! -x "$(command -v brew)" ]; then
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

mkdir -p ~/.ssh
cat > ~/.ssh/config <<EOF
Host *
	AddKeysToAgent yes
	UseKeychain yes
	IdentityFile ~/.ssh/id_rsa
EOF

chflags nohidden ~/Library/

# Disable Time Machine
sudo tmutil disable

./setup/mac-os/defaults.sh

# Override Spectacle config
mkdir -p ~/Library/Application\ Support/Spectacle
cp content/mac-os/Shortcuts.json ~/Library/Application\ Support/Spectacle

for tap in "${TAPS[@]}"
do
	brew tap "$tap"
done

brew update
brew upgrade
brew install ${FORMULAS[*]} || echo -n ""
brew install --with-default-names ${DEFAULT_NAME_FORMULAS[*]} || echo -n ""

for cask in "${CASKS[@]}"
do
	renew_sudo
	[[ -v QUICK ]] || brew cask install $cask || echo -n ""
done

[[ -v QUICK ]] || mas install ${MAS[*]}

brew cleanup

./setup/shared/setup.sh
ln -sf ~/.rustup/toolchains/stable-x86_64-apple-darwin/share/zsh/site-functions/_cargo ~/.antigen/completions/_cargo


# Append zsh to shells
if ! cat /etc/shells | grep -q "/usr/local/bin/zsh" ; then
	echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
fi

cp -r content/mac-os/dotfiles/. ~/
cp -r content/shared/dotfiles/. ~/

renew_sudo
sudo chsh -s /usr/local/bin/zsh $(whoami)

# Symlink WireGuard configuration directory to wg-quick lookup path
sudo ln -sfn $HOME/Dropbox/VPN/WireGuard/ /etc/wireguard

# Reset LaunchPad
defaults write com.apple.dock ResetLaunchPad -bool true; killall Dock
