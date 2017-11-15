### Installation

1. Clone this project

```
$ git clone git@github.com:zoltan-nz/dotfiles.git ~/projects/dotfiles --recurse-submodules
```

2. Update submodules

```
$ git submodule update --recursive --remote
```

3. Clone brew in ~/.brew
4. Install zsh, coreutils, tmux, fasd

```
$ ~/.brew/bin/brew zsh coreutils
```

5. Symlink the following files:

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

6. Clone .nvm

```
$ git clone https://github.com/creationix/nvm.git ~/.nvm
```

7. Install Node.js

```
$ nvm install 8
```

8. Install powerline fonts (drag and drop)

9. Install iTerm2 themes

10. Install rbenv and pyenv 
