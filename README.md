### Setup a mac with dotfiles

1. Install XCode.

2. Setup git.

```
$ git config --global user.name ''
$ git config --global user.email ''
$ git config --global core.excludesfile ~/.gitignore
```

3. [Setup ssh keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)


4. Clone this repository in `~/projects/dotfiles`

```
$ git clone git@github.com:zoltan-nz/dotfiles.git ~/projects/dotfiles --recurse-submodules
```

5. Update submodules

```
$ git submodule update --recursive --remote
```

6. Clone brew in ~/.brew

```
$ git clone git@github.com:Homebrew/brew.git ~/.brew
```

7. Install zsh, coreutils, tmux, fasd

```
$ ~/.brew/bin/brew zsh coreutils tmux fasd mc rbenv pyenv jenv ruby-build
```

8. Symlink the following files:

```
$ ln -s ~/projects/dotfiles/.bin ~/.bin &&
ln -s ~/projects/dotfiles/.bin ~/.bin &&
ln -s ~/projects/dotfiles/.vimrc ~/.vimrc &&
ln -s ~/projects/dotfiles/.vimrc.bundles ~/.vimrc.bundles &&
ln -s ~/projects/dotfiles/.zshrc ~/.zshrc &&
ln -s ~/projects/dotfiles/.gemrc ~/.gemrc &&
ln -s ~/projects/dotfiles/.tmux.conf ~/.tmux.conf &&
ln -s ~/projects/dotfiles/.tmux.util ~/.tmux.util &&
cp ~/projects/dotfiles/.zshrc.local ~/.zshrc.local
```

9. Clone .nvm

```
$ git clone https://github.com/creationix/nvm.git ~/.nvm
```

10. Install Node.js

```
$ ~/.nvm/nvm install 8
```

11. Install `Powerline` fonts (drag and drop)

12. Install [iTerm2](https://www.iterm2.com/) `iTerm2` themes

13. Install [Spectacle](https://www.spectacleapp.com/)

14. Setup ruby environment with `rbenv`

15. Setup python environment with `pyenv`

16. Setup go environment
