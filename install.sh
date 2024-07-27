add-apt-repository ppa:apt-fast/stable -y
apt-get update -y
apt-get install apt-fast  -y
apt update -y
apt upgrade -y
apt install ubuntu-restricted-extras -y
apt-get autoclean -y
apt install flatpak -y
apt install gnome-software-plugin-flatpak -y
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
apt install gdebi -y
apt install synaptic -y
snap remove firefox -y
cd ~/snap
rm -r firefox
sudo gedit /etc/apt/preferences.d/firefox-no-snap
apt purge firefox
add-apt-repository ppa:mozillateam/ppa
apt-get update
apt install firefox
