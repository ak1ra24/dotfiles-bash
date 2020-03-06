#! /bin/bash
apt update
# echo "get dotfiles"
# git clone https://github.com/ak1ra24/dotfiles.git
echo "#############################################################"
echo "install tmux nvim"
echo "#############################################################"
apt-get install software-properties-common tmux bash-completion build-essential -y
add-apt-repository ppa:neovim-ppa/stable -y
apt update
apt-get install neovim -y

echo "#############################################################"
echo "install exa ripgrep fzf bat"
echo "#############################################################"
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/11.0.2/ripgrep_11.0.2_amd64.deb
curl -LO https://github.com/sharkdp/bat/releases/download/v0.12.1/bat_0.12.1_amd64.deb
curl -LO https://github.com/ogham/exa/releases/download/v0.9.0/exa-linux-x86_64-0.9.0.zip
dpkg -i ripgrep_11.0.2_amd64.deb
dpkg -i bat_0.12.1_amd64.deb
unzip exa-linux-x86_64-0.9.0.zip -d /usr/local/bin
mv /usr/local/bin/exa-linux-x86_64 /usr/local/bin/exa
rm -rf ripgrep_11.0.2_amd64.deb
rm -rf bat_0.12.1_amd64.deb
rm -rf exa-linux-x86_64-0.9.0.zip

echo "#############################################################"
echo "install node yarn"
echo "#############################################################"
curl -sL https://deb.nodesource.com/setup_12.x | bash -
apt-get install -y nodejs
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt-get update
apt-get install -y yarn
# git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
# ~/.fzf/install

echo "#############################################################"
echo "utils install"
echo "#############################################################"
apt install -y python3 python3-pip traceroute dnsutils tcpdump iputils-ping net-tools
add-apt-repository ppa:longsleep/golang-backports -y
apt update
apt install -y golang-go

echo "#############################################################"
echo "create config file"
echo "#############################################################"
mkdir -p ~/.config/nvim
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -O ~/.git-completion.bash
chmod a+x ~/.git-completion.bash
wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -O ~/.git-prompt.sh
chmod a+x ~/.git-prompt.sh
cp ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
cp ~/dotfiles/.bashrc ~/.bashrc
# ln -sf ~/dotfiles/nvim/init.vim ~/.config/nvim/init.vim
# ln -sf ~/dotfiles/tmux/.tmux.conf ~/.tmux.conf
# ln -sf ~/dotfiles/zsh/.zshrc ~/.zshrc
# ln -sf ~/dotfiles/zsh/.zshenv ~/.zshenv

# echo "install pyenv pyvirtualenv goenv"
# apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
# 	libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
# 	xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
# git clone https://github.com/pyenv/pyenv.git ~/.pyenv
# git clone https://github.com/syndbg/goenv.git ~/.goenv
# git clone https://github.com/pyenv/pyenv-virtualenv.git $HOME/.pyenv/plugins/pyenv-virtualenv

