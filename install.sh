#!/bin/sh
#
# Update Repositories
sudo apt update

# Install dependencies
sudo apt install chromium fish dunst i3 i3status rofi xfce4-terminal flameshot feh nodejs npm ripgrep polybar -y
#sudo apt install picom -y

# Setup Fish Shell
sudo sh -c 'echo /bin/fish >> /etc/shells'
chsh -s /bin/fish

# Install Fira Code Font
cd /tmp
mkdir ~/.local/share/fonts
wget 'https://github.com/tonsky/FiraCode/releases/download/6.2/Fira_Code_v6.2.zip'
unzip 'Fira_Code_v6.2.zip'
mv ttf/FiraCode-* ~/.local/share/fonts/
wget 'https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/FiraCode.zip'
unzip FiraCode.zip
mv FiraCodeNerdFont* ~/.local/share/fonts/
fc-cache -f -v

# Install nvim
cd /tmp
wget 'https://github.com/neovim/neovim/releases/download/stable/nvim-linux64.tar.gz'
tar -xf nvim-linux64.tar.gz
cd nvim-linux64/
sudo cp -rf ./* /usr/

# Install Astronvim dependencies
cd /tmp
wget 'https://github.com/ClementTsang/bottom/releases/download/0.9.6/bottom_0.9.6_amd64.deb'
sudo dpkg -i bottom_0.9.6_amd64.deb

# Install Astronvim
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim

# Install Polybar Requirements
cd /tmp
git clone --depth=1 https://github.com/adi1090x/polybar-themes.git
cd polybar-themes/
./setup.sh
rm -rf ~/.config/polybar/

# Copy Files
cp .config/ ~/ -r
cp screen_wallpaper.* ~/

# Init nvim
nvim

# Print TODO
echo 'Things to setup:'
echo '- Install and configure Burpsuite'
echo '- Install Burpsuite extensions'
echo '- Install nvim TSs and LSPs (:TSInstall python; :TSInstall javascript; :TSInstall bash; :LspInstall pyright; :LspInstall typos_lsp; :LspInstall eslint; :LspInstall grammarly)'
echo '\nAfter finish all setup, restart the machine...'
