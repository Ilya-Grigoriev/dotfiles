#!/bin/sh

mkdir ~/.local/share
mkdir ~/.config


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼

echo "Setting up Xorg..."
mkdir ~/.config/x11
cp .config/x11/* ~/.config/x11
cp .xinitrc ~/
echo "Setting up ended"


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo "Setting up aliases..." 
mkdir ~/.config/aliases
cp .config/aliases/* ~/.config/aliases
echo "Setting up ended"


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo "Installing pacman..."
# Source: https://www.cyberithub.com/how-to-install-pacman-package-manager-on-ubuntu-20-04-lts/
wget https://gitlab.com/trivoxel-utils/deb-pacman/uploads/460d83f8711c1ab5e16065e57e7eeabc/deb-pacman-2.0-0.deb
sudo dpkg -i deb-pacman-2.0-0.deb
rm -rf deb-pacman-*
echo "Pacman installed!"


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


sudo pacman -S zathura cmake zsh curl neofetch lolcat ripgrep xclip fzf tldr libxft-dev libx11-dev cmus gh pass feh copyq kdeconnect vim tmux libx11-dev mesa-common-dev libglu1-mesa-dev libxrandr-dev libxi-dev libxinerama-dev htop mpv obs-studio suckless-tools synaptic network-manager fontforge pipx python3-pip

echo ""
echo "Do you want to install rust?"  
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	curl https://sh.rustup.rs -sSf | sh
fi

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
echo "Activating tap with touchpad..."
sudo mkdir /etc/X11/xorg.conf.d
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

	(cd /tmp && git clone https://github.com/wting/autojump.git && cd autojump && ./install.py)


	mkdir ~/.config/zsh
	cp .config/zsh/.* ~/.config/zsh
	echo "oh-my-zsh installed"
fi



# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Add scripts.." | lolcat
mkdir ~/.local/share/scripts
cp .local/share/scripts/* ~/.local/share/scripts
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
	echo "Liberation fonts installed" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""

echo "Do you want to install Thorium?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	mkdir -p ~/dws
	
	echo "Installing Thorium..." | lolcat
	(cd ~/dws && wget https://github.com/Alex313031/thorium/releases/download/M121.0.6167.204/thorium-browser_121.0.6167.204_AVX.deb && sudo dpkg -i thorium-browser_121.0.6167.204_AVX.deb)
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
	mkdir ~/.config/dwm
	git clone https://git.suckless.org/dwm /tmp/dwm/
	sudo mv /tmp/dwm/* ~/.config/dwm/
	cp .config/dwm/* ~/.config/dwm
	(cd ~/.config/dwm/ && cp config.def.h config.h && sudo make clean install)
	sudo rm -rf /tmp/dwm

	sudo mkdir /usr/share/xsessions
	bash tools/dwm_xapp.sh
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
	mkdir ~/.config/dwmstatus
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
echo "Do you want to install st?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Installing st..." | lolcat
	mkdir ~/.config/st
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
	mkdir -p .local/share/gnupg
	gpg --full-gen-key
	echo "Setting up ended" | lolcat
fi


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Do you want ot setting up ssh for GitHub?"
read yes_or_no
if [ $yes_or_no == "yes" ]
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
echo "Do you want to setting up nvim?"
read yes_or_no
if [[ $yes_or_no == "yes" ]];
then
	echo "Setting up nvim..." | lolcat
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
mkdir -p ~/ims/wallpapers
cp ims/wallpapers/* ~/ims/wallpapers

cp .config/.fehbg ~/.config/
echo "Setting up ended" | lolcat
