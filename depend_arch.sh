if ! [ -f "/usr/bin/yay" ]; then
	echo "Installing yay..."
	(cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si)
	rm -rf /tmp/yay
	echo "yay installed"
fi

yay -S obsidian-bin thorium-browser-bin fd ttf-jetbrains-mono-git nsxiv sent
sudo pacman -S htop bc vim vi lolcat grep fzf cmus nnn gimp dmenu zathura npm rust github-cli less neofetch tree lua obs-studio mpv man wpa_supplicant-openrc dhcpcd-openrc


echo "Setting up network..." | lolcat
sudo rc-update add dhcpcd default
sudo rc-service dhcpcd start

sudo rc-update add wpa_supplicant default
sudo rc-service wpa_supplicant start

sudo rc-update add wpa_supplicant default
sudo rc-service wpa_supplicant start


echo "Setting up audio..." | lolcat
sudo rc-update add alsasound default
sudo rc-service alsasound start
sudo gpasswd $(echo $USER) audio
