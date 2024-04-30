if [ -z "$(dpkg --list | grep 'deb-pacman')" ]
then
	echo "Installing pacman..."
	# Source: https://www.cyberithub.com/how-to-install-pacman-package-manager-on-ubuntu-20-04-lts/
	wget https://gitlab.com/trivoxel-utils/deb-pacman/uploads/460d83f8711c1ab5e16065e57e7eeabc/deb-pacman-2.0-0.deb
	sudo dpkg -i deb-pacman-2.0-0.deb
	rm -rf deb-pacman-*
	echo "Pacman installed!"
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


sudo pacman -S zathura cmake zsh curl neofetch lolcat ripgrep xclip fzf tldr libxft-dev libx11-dev cmus gh pass feh kdeconnect tmux libx11-dev mesa-common-dev libglu1-mesa-dev libxrandr-dev libxi-dev libxinerama-dev htop mpv obs-studio suckless-tools synaptic network-manager fontforge pipx python3-pip flameshot entr pandoc libimlib2-dev libexif-dev abiword fd-find meson ninja-build fonts-recommended libgtk-3-dev pulseaudio alsa-utils libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev bc syncthing libcairo2-dev npm upower compton lua-check ruby-dev nnn adb xorg bat libreoffice-base mupdf bison libncurses-dev ntfs-3g kolourpaint tk tk-dev screenkey gimp
