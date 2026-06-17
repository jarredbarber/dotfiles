## Software to install

- Chrome
- Homebrew
- iTerm2
- Rectangle Pro
- XCode Dev Tools (run `git` in terminal)

## CLI stuff

- Setup SSH Key (`ssh-keygen`)
- Add SSH key to github

```bash
brew install \
    stow \
    wget \
    neovim \
    font-sf-mono-nerd-font-ligaturized 

sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"

# Setup git
git config --global user.name 'Jarred Barber'
git config --global user.email 'jpb5082@gmail.com'

cd
git clone git@github.com:jarredbarber/dotfiles.git
git clone git@github.com:jarredbarber/writing.git

cd ~/dotfiles
stow zsh
stow vim
```

