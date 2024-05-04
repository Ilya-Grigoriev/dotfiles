if ! [ -f "/usr/bin/yay" ]; then
	echo "Installing yay..."
	rm -rf /tmp/yay
	(cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si)
	rm -rf /tmp/yay
	echo "yay installed"
fi

yay -S obsidian-bin thorium-browser-bin fd-git ttf-jetbrains-mono-git nsxiv sent
sudo pacman -S htop bc vim vi lolcat grep fzf cmus nnn gimp dmenu zathura zathura-pdf-poppler npm rust github-cli less neofetch tree lua obs-studio mpv man wpa_supplicant-openrc dhcpcd-openrc networkmanager-openrc man wget ripgrep usbutils alsa-utils alsa-firmware pulseaudio-alsa pulseaudio-bluetooth syncthing-openrc entr pandoc flameshot yt-dlp sof-firmware unzip xorg xorg-xinit feh xf86-video-intel xsel openssh xclip tldr fzf imagemagick bash-completion bluez bluez-utils bluez-openrc libreoffice-fresh


echo "Setting up network..." | lolcat
sudo rc-update add dhcpcd default
sudo rc-service dhcpcd start

sudo rc-update add wpa_supplicant default
sudo rc-service wpa_supplicant start

sudo rc-update add NetworkManager default
sudo rc-service NetworkManager start

echo "Setting up bluetooth..." | lolcat
sudo rc-update add bluetoothd default
sudo rc-service bluetoothd start

echo "Setting up audio..." | lolcat
sudo rc-update add alsasound default
sudo rc-service alsasound start
sudo gpasswd $(echo $USER) audio

echo "Setting up bluetooth..." | lolcat
sudo rc-update add bluetooth default
sudo rc-service bluetooth start
