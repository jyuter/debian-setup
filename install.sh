apt update -y
apt upgrade -y

apt-get autoclean -y
apt install flatpak -y
apt install plasma-discover-backend-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

#chrome
wget https://dl-ssl.google.com/linux/linux_signing_key.pub -O /tmp/google.pub
gpg --no-default-keyring --keyring /etc/apt/keyrings/google-chrome.gpg --import /tmp/google.pub
echo 'deb [arch=amd64 signed-by=/etc/apt/keyrings/google-chrome.gpg] http://dl.google.com/linux/chrome/deb/ stable main' | sudo tee /etc/apt/sources.list.d/google-chrome.list
apt-get update 
apt-get install google-chrome-stable

#Install Utils
apt install gdebi -y
apt install synaptic -y
apt install zsh -y
apt install util-linux -y
apt install htop -y
apt install neofetch -y
apt install neovim -y
apt install fzf -y
apt install bat -y
apt install eza -y
apt install cpufetch -y
apt install lsd -y
apt install bpytop -y
apt install speedtest-cli -y
apt install lolcat -y
apt install tmux -y
apt install ripgrep -y
apt install zoxide -y
apt install entr -y
apt install mc -y
apt install stow -y

#Install Fonts
echo "Installing fonts..."
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/JetBrainsMono.zip \
&& cd ~/.local/share/fonts \
&& unzip JetBrainsMono.zip \
&& rm JetBrainsMono.zip \
&& fc-cache -fv \
&& cd ~

wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Meslo.zip \
&& cd ~/.local/share/fonts \
&& unzip -o Meslo.zip \
&& rm Meslo.zip \
&& fc-cache -fv \
&& cd ~

wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Lekton.zip \
&& cd ~/.local/share/fonts \
&& unzip -o Lekton.zip \
&& rm Lekton.zip \
&& fc-cache -fv \
&& cd ~

wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/RobotoMono.zip \
&& cd ~/.local/share/fonts \
&& unzip -o RobotoMono.zip \
&& rm RobotoMono.zip \
&& fc-cache -fv \
&& cd ~

wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/Mononoki.zip \
&& cd ~/.local/share/fonts \
&& unzip -o Mononoki.zip \
&& rm Mononoki.zip \
&& fc-cache -fv \
&& cd ~

wget -P ~/.local/share/fonts https://github.com/source-foundry/Hack/releases/download/v3.003/Hack-v3.003-ttf.zip \
&& cd ~/.local/share/fonts \
&& unzip -o Hack-v3.003-ttf.zip \
&& rm Hack-v3.003-ttf.zip \
&& fc-cache -fv \
&& cd ~

apt-get install fonts-powerline

# Shell Utils
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# Dev Tools

# Git
apt install git -y
sudo -n -i -u jyuter git config --global user.name "Josh Yuter"
sudo -n -i -u jyuter git config --global user.email "jyuter@gmail.com"
apt install gh

#Dotnet
apt-get install -y dotnet-sdk-8.0
apt-get install -y aspnetcore-runtime-8.0

#Gcc
apt install build-essential -y

#Java
apt install default-jre -y
apt install default-jdk -y

# Go
apt install golang-go -y

#Rust
apt install rustc -y

#Nodejs
apt install nodejs -y
apt install npm -y
npm install -g pnpm
npm install -g bun

#VsCode
apt-get install wget gpg -y
wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" |sudo tee /etc/apt/sources.list.d/vscode.list > /dev/null
rm -f packages.microsoft.gpg
apt install apt-transport-https -y
apt update

#Docker 
sysctl -w kernel.apparmor_restrict_unprivileged_userns=0 
apt-get install ca-certificates curl -y
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
apt-get update
apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y


apt install gnome-terminal -y
wget -q https://desktop.docker.com/linux/main/amd64/docker-desktop-amd64.deb?utm_source=docker&utm_medium=webreferral&utm_campaign=docs-driven-download-linux-amd64 -O ./docker-desktop.deb
apt-get install ./docker-desktop.deb -y
rm -f ./docker-desktop.deb
systemctl --user start docker-desktop



# Remove Firefox Snap
systemctl stop var-snap-firefox-common-host\\x2dhunspell.mount
systemctl disable var-snap-firefox-common-host\\x2dhunspell.mount 
snap remove firefox -y
cd ~/snap
rm -r firefox
sudo gedit /etc/apt/preferences.d/firefox-no-snap
apt purge firefox
add-apt-repository ppa:mozillateam/ppa
apt-get update
apt install firefox


#add-apt-repository ppa:apt-fast/stable -y
#apt-get update -y
#apt-get install apt-fast  -y
#apt install ubuntu-restricted-extras -y
#apt install gnome-software-plugin-flatpak -y
