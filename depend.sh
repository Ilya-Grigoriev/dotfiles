cp .xinitrc ~/


############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo "Add superuser..."
su -c "nano /etc/sudoers"
echo "Superuser added"


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Installing pacman..."
# Source: https://www.cyberithub.com/how-to-install-pacman-package-manager-on-ubuntu-20-04-lts/
wget https://gitlab.com/trivoxel-utils/deb-pacman/uploads/460d83f8711c1ab5e16065e57e7eeabc/deb-pacman-2.0-0.deb
sudo dpkg -i deb-pacman-2.0-0.deb
rm -rf deb-pacman-*
echo "Pacman installed!"


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


sudo pacman -S zathura cmake zsh curl neofetch lolcat ripgrep xclip fzf tldr libxft-dev libx11-dev cmus gh pass feh copyq kdeconnect
curl https://sh.rustup.rs -sSf | sh
curl https://pyenv.run | bash


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Add scripts.." | lolcat
md ~/.local/share/scripts
cp .local/share/scripts/* ~/.local/share/scripts
echo "Scripts added" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼

echo ""
echo "Installing Nerd fonts..." | lolcat
(cd /tmp && wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/AnonymousPro.zip && unzip AnonymousPro.zip -d fonts && cd fonts && sudo cp *.ttf /usr/share/fonts)
rm -rf /tmp/fonts /tmp/AnonymousPro*
echo "Nerd fonts installed" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Installing lazygit..." | lolcat
# Source https://github.com/jesseduffield/lazygit?tab=readme-ov-file#installation
LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
tar xf lazygit.tar.gz lazygit
sudo install lazygit /usr/local/bin
rm -rf lazygit*
echo "lazygit installed" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Installing dwm..." | lolcat
mkdir ~/.config/dwm
git clone https://git.suckless.org/dwm /tmp/dwm/
sudo mv /tmp/dwm/* ~/.config/dwm/
cp .config/dwm/* ~/.config/dwm
(cd ~/.config/dwm/ && cp config.def.h config.h && sudo make clean install)
sudo rm -rf /tmp/dwm

sudo bash deep/dwm_xapp.sh
echo "dwm installed" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Installing dwmstatus..." | lolcat
mkdir ~/.config/dwmstatus
git clone git://git.suckless.org/dwmstatus /tmp/dwmstatus
sudo mv /tmp/dwmstatus/* ~/.config/dwmstatus
cp .config/dwmstatus/* ~/.config/dwmstatus/
(cd ~/.config/dwmstatus && sudo make && sudo make PREFIX=/usr install)
sudo rm -rf /tmp/dwmstatus
echo "dwmstatus installed" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Installing st..." | lolcat
mkdir ~/.config/st
git clone https://git.suckless.org/st /tmp/st
sudo mv /tmp/st/* ~/.config/st
cp .config/st/* ~/.config/st/
(cd ~/.config/st && sudo make install)
sudo rm -rf /tmp/st
echo "st installed" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Installing oh-my-zsh..." | lolcat
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo bash tools/zsh_env.sh

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.config/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.config/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

mkdir ~/.config/zsh
cp .config/zsh/.* ~/.config/zsh

echo "oh-my-zsh installed" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Setting up GitHub CLI..." | lolcat
gh auth login
echo "Setting up ended" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Setting up gpg for pass..." | lolcat
# Source: https://bbs.archlinux.org/viewtopic.php?id=259173
declare -x XDG_DATA_HOME=~/.local/share
declare -x GNUPGHOME=$XDG_DATA_HOME/gnupg
md -p .local/share/gnupg
gpg --full-gen-key
echo "Setting up ended" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Setting up ssh for GitHub..." | lolcat
echo "Enter your email: "
read email
ssh-keygen -t ed25519 -C "$email"
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519
cat ~/.ssh/id_ed25519.pub
echo "Setting up ended" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Setting up pass..." | lolcat
gpg --list-keys
echo "Enter gpg id for public key:"
read public_key
pass init $public_key
echo "Setting up ended" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Setting up nvim..." | lolcat
git clone https://github.com/ilya-grigoriev/nvim /tmp/nvim
sudo mv /tmp/nvim/* ~/.config/nvim
rm -rf /tmp/nvim
echo "Setting up ended" | lolcat


# ▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲
############################################
# ▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼


echo ""
echo "Setting up wallpapers for system" | lolcat
md ~/ims/wallpapers
cp ims/wallpapers/* ~/ims/wallpapers

cp .config/.fehbg ~/.config/
echo "Setting up ended" | lolcat
