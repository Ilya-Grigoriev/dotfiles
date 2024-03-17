#!/bin/sh

mkdir -p ~/.local/share
mkdir -p ~/.config
mkdir -p ~/dev


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo "Setting up aliases..."
mkdir -p ~/.config/aliases
cp .config/aliases/* ~/.config/aliases
echo "Setting up ended"


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


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


sudo pacman -S zathura cmake zsh curl neofetch lolcat ripgrep xclip fzf tldr libxft-dev libx11-dev cmus gh pass feh copyq kdeconnect vim tmux libx11-dev mesa-common-dev libglu1-mesa-dev libxrandr-dev libxi-dev libxinerama-dev htop mpv obs-studio suckless-tools synaptic network-manager fontforge pipx python3-pip flameshot entr pandoc libimlib2-dev libexif-dev abiword fd-find meson ninja-build fonts-recommended libgtk-3-dev pulseaudio alsa-utils libglfw3-dev libgl1-mesa-dev libglu1-mesa-dev bc syncthing libcairo2-dev npm upower compton lua-check ruby-dev nnn adb xorg bat libreoffice-base mupdf bison libncurses-dev ntfs-3g


echo ""
mkdir -p ~/.local/share/cargo/env
echo "Do you want to install rust?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	curl https://sh.rustup.rs -sSf | sh
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Setting up Xorg..."
mkdir -p ~/.config/x11
cp .config/x11/* ~/.config/x11
cp .xinitrc ~/
echo "Setting up ended"


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Activating tap with touchpad..."
sudo mkdir -p /etc/X11/xorg.conf.d
sudo bash tools/touchpad.sh

echo "Activating ended"


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Setting up vim..." | lolcat
cp -r .vim ~/
echo "Setting up ended" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install oh-my-zsh?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Installing oh-my-zsh..."

	rm -rf ~/.config/.oh-my-zsh/
	sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	rm -rf ~/.zshrc

	sudo bash tools/zsh_env.sh

	git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.config/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

	mkdir -p ~/.config/zsh
	cp .config/zsh/.* ~/.config/zsh
	echo "oh-my-zsh installed"
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install pyenv?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	curl https://pyenv.run | bash
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Add scripts.." | lolcat
mkdir -p ~/.local/bin/
chmod +x .local/bin/*
cp .local/bin/* ~/.local/bin/
echo "Scripts added" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install fonts?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Installing Nerd fonts..." | lolcat
	(cd /tmp && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/AnonymousPro.zip && unzip AnonymousPro.zip -d fonts && cd fonts && sudo cp *.ttf /usr/share/fonts)
	rm -rf /tmp/fonts /tmp/AnonymousPro*
	echo "Nerd fonts installed" | lolcat

	echo "Installing Liberation fonts..." | lolcat
	(cd /tmp && git clone https://github.com/liberationfonts/liberation-fonts && cd liberation-fonts && python3 -m venv venv && source venv/bin/activate && pip install fonttools && make && sudo cp liberation-fonts-ttf-*/*.ttf /usr/share/fonts)
	rm -rf /tmp/liberation-fonts
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""

echo "Do you want to install Thorium?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	mkdir -p -p ~/dws

	echo "Installing Thorium..." | lolcat
	sudo rm -fv /etc/apt/sources.list.d/thorium.list && \
	sudo wget --no-hsts -P /etc/apt/sources.list.d/ \
	http://dl.thorium.rocks/debian/dists/stable/thorium.list && \
	sudo apt update

	sudo apt install thorium-browser
	echo "Thorium installed" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install lazygit?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Installing lazygit..." | lolcat
	# Source https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation
	LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
	curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
	tar xf lazygit.tar.gz lazygit
	sudo install lazygit /usr/local/bin
	rm -rf lazygit*
	echo "lazygit installed" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install dwm?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Installing dwm..." | lolcat
	mkdir -p ~/.config/dwm
	git clone https://git.suckless.org/dwm /tmp/dwm/
	sudo mv /tmp/dwm/* ~/.config/dwm/
	cp .config/dwm/* ~/.config/dwm
	(cd ~/.config/dwm/ && cp config.def.h config.h && sudo make clean install)
	sudo rm -rf /tmp/dwm

	sudo mkdir -p /usr/share/xsessions
	sudo bash tools/dwm_xapp.sh
	echo "dwm installed" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install dwmstatus?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Installing dwmstatus..." | lolcat
	mkdir -p ~/.config/dwmstatus
	git clone git://git.suckless.org/dwmstatus /tmp/dwmstatus
	sudo mv /tmp/dwmstatus/* ~/.config/dwmstatus
	cp .config/dwmstatus/* ~/.config/dwmstatus/
	(cd ~/.config/dwmstatus && sudo make && sudo make PREFIX=/usr install)
	sudo rm -rf /tmp/dwmstatus
	echo "dwmstatus installed" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install scroll for st?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Installing scroll..." | lolcat
	git clone https://git.suckless.org/scroll /tmp/scroll
	(cd /tmp/scroll && sudo make install)
	rm -rf /tmp/scroll
	echo "scroll installed" | lolcat
fi



# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install st?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Installing st..." | lolcat
	mkdir -p ~/.config/st
	git clone https://git.suckless.org/st /tmp/st
	sudo mv /tmp/st/* ~/.config/st
	cp .config/st/* ~/.config/st/
	(cd ~/.config/st && sudo cp config.def.h config.h && sudo make install)
	sudo rm -rf /tmp/st
	echo "st installed" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to setting up GitHub CLI?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Setting up GitHub CLI..." | lolcat
	gh auth login
	echo "Setting up ended" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to setting up gpg for pass?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Setting up gpg for pass..." | lolcat
	# Source: https://bbs.archlinux.org/viewtopic.php?id=259173
	declare -x XDG_DATA_HOME=~/.local/share
	declare -x GNUPGHOME=$XDG_DATA_HOME/gnupg
	mkdir -p ~/.local/share/gnupg
	gpg --full-gen-key
	echo "Setting up ended" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want ot setting up ssh for GitHub?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Setting up ssh for GitHub..." | lolcat
	echo "Enter your email: "
	read email
	ssh-keygen -t ed25519 -C "$email"
	eval "$(ssh-agent -s)"
	ssh-add ~/.ssh/id_ed25519
	cat ~/.ssh/id_ed25519.pub
	echo "Setting up ended" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to setting up pass?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Setting up pass..." | lolcat
	gpg --list-keys
	echo "Enter gpg id for public key:"
	read public_key
	pass init $public_key
	echo "Setting up ended" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install Lua?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Instaglling Lua..." | lolcat
	mkdir -p /tmp/lua
	(cd /tmp/lua && curl -L -R -O https://www.lua.org/ftp/lua-5.4.6.tar.gz  && tar zxf lua-5.4.6.tar.gz && cd lua-5.4.6 && make all test && sudo make install)
	rm -rf /tmp/lua
	echo "Installing ended" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install nvim?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	pac -S gettext cmake build-essential
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
	sudo rm -rf /opt/nvim
	sudo tar -C /opt -xzf nvim-linux64.tar.gz
    rm -rf nvim-linux64.tar.gz
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to setting up nvim?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Setting up nvim..." | lolcat
	rm -rf ~/.config/nvim

	git clone https://github.com/ilya-grigoriev/nvim /tmp/nvim
	sudo mv /tmp/nvim ~/.config/

	rm -rf /tmp/nvim
	echo "Setting up ended" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Setting up wallpapers for system" | lolcat
mkdir -p -p ~/ims/wallpapers
cp ims/wallpapers/* ~/ims/wallpapers

cp .config/.fehbg ~/.config/
echo "Setting up ended" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install latex?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Installing latex..." | lolcat
	curl https://raw.githubusercontent.com/ilya-grigoriev/ege-informatics/main/tools/depends_linux.sh | bash
	echo "Installing ended" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install nsxiv?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	mkdir -p /tmp/nsxiv
	git clone https://github.com/nsxiv/nsxiv /tmp/nsxiv
	(cd /tmp/nsxiv && make && sudo cp nsxiv /usr/bin)

	rm -rf /tmp/nsxiv
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install sent?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	mkdir -p /tmp/sent
	git clone https://git.suckless.org/sent /tmp/sent
	(cd /tmp/sent && make && sudo cp sent /usr/bin)

	mkdir -p ~/.config/sent
	cp /tmp/sent/* ~/.config/sent

	rm -rf /tmp/nsxiv
    cp .config/sent/* ~/.config/sent
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install Armcord?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Installing Armcord..." | lolcat
	curl -fsSL https://apt.armcord.app/public.gpg | sudo gpg --dearmor -o /usr/share/keyrings/armcord.gpg
	echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/armcord.gpg] https://apt.armcord.app/ stable main" | sudo tee /etc/apt/sources.list.d/armcord.list
	sudo apt update
	sudo apt install armcord
	echo "Armcord installed" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install Discord?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Installing Discord..." | lolcat
	wget https://dl.discordapp.net/apps/linux/0.0.45/discord-0.0.45.deb
	sudo dpkg -i discord-*.deb
	rm -rf discord-*.deb
	echo "Discord installed" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install Obsidian?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	mkdir -p /tmp/obsidian
	(cd /tmp/obsidian && wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.8/Obsidian-1.5.8.AppImage && chmod +x Obsidian-1.5.8.AppImage && sudo cp Obsidian-1.5.8.AppImage /usr/bin/obsidian)
	rm -rf /tmp/obsidian
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to install zaread (script allows Microsoft Office)?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Installing zaread..." | lolcat
	git clone https://github.com/paoloap/zaread /tmp/zaread
	(cd /tmp/zaread && sudo make install)
	rm -rf /tmp/zaread
	echo "zaread installed" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to setting up obs?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Setting up obs..." | lolcat
	mkdir -p ~/.config/obs-studio
	echo $'\n[Hotkeys]
OBSBasic.StartRecording={"bindings":[{"alt":true,"control":true,"key":"OBS_KEY_S"}]}
OBSBasic.StopRecording={"bindings":[{"alt":true,"control":true,"key":"OBS_KEY_S"}]}' >> ~/.config/obs-studio/global.ini
	echo "Setting up ended" | lolcat

fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to setting up tmux?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Setting up tmux..." | lolcat
	cp -r .config/tmux/* ~/.config/tmux

	git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
	echo "Setting up ended" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to setting up nnn?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Setting up nnn..." | lolcat
	mkdir -p /tmp/dragon
	git clone https://github.com/mwh/dragon /tmp/dragon
	(cd /tmp/dragon && make && sudo cp dragon /usr/bin)
	rm -rf /tmp/dragon

	sh -c "$(curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs)"
	cp .config/nnn.conf ~/.config/
	echo "Setting up ended" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Setting up gtk theme..." | lolcat
mkdir -p ~/.config/gtk-3.0
echo "[Settings]
gtk-application-prefer-dark-theme=1" >> ~/.config/gtk-3.0/settings.ini
echo "Setting up ended" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want to setting up git?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Setting up git..." | lolcat
	echo "Enter your email for git:"
	read email

	echo ""
	echo "Enter your name for git:"
	read name
	git config --global user.email $email
	git config --global user.name $name
	echo "Setting ended" | lolcat
fi


echo ""
echo "Do you want to setting up zathura?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Setting up zathura..." | lolcat
	mkdir -p ~/.config/zathura
	cp .config/zathura/* ~/.config/zathura
	echo "Setting up ended" | lolcat
fi

# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Other" | lolcat
cp -r .config/* ~/.config/
sudo cp /usr/bin/fdfind /usr/bin/fd
rm -rf ~/.tmux ~/.pyenv ~/.gnupg ~/.oh-my-zsh
mkdir -p ~/sng

echo "End" | lolcat
