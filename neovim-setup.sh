sudo add-apt-repository -y ppa:neovim-ppa/unstable
sudo apt-get -y update
sudo apt-get -y install neovim
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/12.1.1/ripgrep_12.1.1_amd64.deb
sudo dpkg -i ripgrep_12.1.1_amd64.deb
mkdir ~/.config
cd ~/.config
git clone https://github.com/gjvera/nvim.git
cd ~/
pip install neovim
nvim --headless +PlugInstall +qa
