# Zoltan's Dotfiles

## MacOS Setup

- Install `XCode`.
- Setup `git`.

```bash
git config --global user.name ''
git config --global user.email ''
git config --global core.excludesfile ~/.gitignore
```

- [Setup ssh keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
- Clone this repository in `~/projects/dotfiles`

```bash
git clone git@github.com:zoltan-nz/dotfiles.git ~/projects/dotfiles --recurse-submodules
```

- Update submodules

```bash
git submodule update --recursive --remote
```

- Clone brew in ~/.brew

```bash
git clone git@github.com:Homebrew/brew.git ~/.brew
```

- Install `zsh`, `coreutils`, `tmux`, `fasd`, `mc`, `rbenv`, `pyenv`, `jenv`, `ruby-build`, `golang`

```bash
~/.brew/bin/brew install zsh coreutils tmux fasd mc rbenv pyenv jenv ruby-build golang
```

- Symlink the following files:

```bash
ln -s ~/projects/dotfiles/.vimrc ~/.vimrc &&
ln -s ~/projects/dotfiles/.zshrc ~/.zshrc &&
ln -s ~/projects/dotfiles/.gemrc ~/.gemrc &&
ln -s ~/projects/dotfiles/.tmux.conf ~/.tmux.conf &&
ln -s ~/projects/dotfiles/.tmux.util ~/.tmux.util &&
cp ~/projects/dotfiles/.zshrc.local ~/.zshrc.local
```

- Clone .nvm

```bash
git clone https://github.com/creationix/nvm.git ~/.nvm
```

- Install Node.js

```bash
~/.nvm/nvm install 10 --reinstall-packages-from=10 --latest-npm
```

- Install `Powerline` fonts: drag and drop from `submodules/fonts/powerline` and `submodules/fonts/Menlo-for-Powerline` fonts in Mac `Font Book` Application.
- Install [iTerm2](https://www.iterm2.com/) `iTerm2` and add your theme from `submodules/iTerm2-Color-Schemes`.
- Install [Spectacle](https://www.spectacleapp.com/)
- Setup `ruby` environment with `rbenv`
- Setup `python` environment with `pyenv`
- Setup `go` environment
