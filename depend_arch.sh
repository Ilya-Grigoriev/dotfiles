if ! [ -f "/usr/bin/yay" ]; then
	echo "Installing yay..."
	(cd /tmp && git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si)
	rm -rf /tmp/yay
	echo "yay installed"
fi

yay -S obsidian-bin thorium-browser-bin fd
sudo pacman -S htop bc vim vi lolcat grep fzf cmus nnn gimp dmenu zathura npm rust github-cli less neofetch tree lua obs-studio mpv
