# Zoltan's Dotfiles

## MacOS Setup

- Install `Chrome`.
- Install `JetBrains ToolBox`.
- Install `Visual Studio Code`.
- Install `Spectacle`.
- Install `iTerm`.
- Install `XCode`.

- Setup `git`:

```bash
git config --global user.name ''
git config --global user.email ''
git config --global core.excludesfile ~/.gitignore
git config --global pager.branch false
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

- Install `zsh`, `coreutils`, `tmux`, `fd`, `fasd`, `mc`

```bash
~/.brew/bin/brew install zsh coreutils tmux htop fasd mc zlib
```

- Symlink the following files:

```bash
ln -s ~/projects/dotfiles/dotfiles/vimrc ~/.vimrc &&
ln -s ~/projects/dotfiles/dotfiles/zshrc ~/.zshrc &&
ln -s ~/projects/dotfiles/dotfiles/gemrc ~/.gemrc &&
ln -s ~/projects/dotfiles/dotfiles/tmux.conf ~/.tmux.conf &&
cp ~/projects/dotfiles/dotfiles/zshrc.local.template ~/.zshrc.local
```

- Setup default shell in System Preferences -> Users and Groups -> Authenticate -> Right click on user name -> Advance Options... -> change the Login shell to `/bin/zsh`

- Install `Powerline` fonts: drag and drop from `submodules/fonts/powerline` and `submodules/fonts/Menlo-for-Powerline` fonts in Mac `Font Book` Application.

- Install [iTerm2](https://www.iterm2.com/) and add your theme from `submodules/iTerm2-Color-Schemes`.

- Clone fzf

```
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

- Install Python

https://github.com/pyenv/pyenv-installer

!! Run `brew info zlib` and `brew info sqlite` to get the environmental variable setup scripts for compilers.

```bash
$ curl https://pyenv.run | bash
```

- Install Ruby

```bash
$ git clone https://github.com/rbenv/rbenv.git ~/.rbenv
$ git clone https://github.com/sstephenson/ruby-build ~/.rbenv/plugins/ruby-build
$ RUBY_CONFIGURE_OPTS=--with-readline-dir=`brew --prefix readline` rbenv install 2.6.3
```

- Install Go

```
brew install golang
```

- Install Node with .nvm

```bash
git clone https://github.com/creationix/nvm.git ~/.nvm
```

- Install Node.js first time:

```bash
~/.nvm/nvm install 12 --latest-npm
```

- Update Node.js:

```bash
~/.nvm/nvm install 12 --reinstall-packages-from=10 --latest-npm
```


- Install [Spectacle](https://www.spectacleapp.com/)
- Setup `ruby` environment with `rbenv`
- Setup `python` environment with `pyenv`
- Setup `go` environment

## Install .Net Core

```
brew tap caskroom/cask
brew cask install dotnet-sdk
brew cask install visual-studio-code
```

## Setup Shell Session Limits on Mac

Source: [Shell Session Limit - Stackoverflow](https://unix.stackexchange.com/questions/108174/how-to-persistently-control-maximum-system-resource-consumption-on-mac?answertab=votes#tab-top)

Temporary solution is using `ulimit`.

Permanent solution is creating a `LaunchDaemon`.

```shell
sudo touch /Library/LaunchDaemons/limit.maxfiles.plist
sudo chown root:wheel /Library/LaunchDaemons/limit.maxfiles.plist
sudo vim /Library/LaunchDaemons/limit.maxfiles.plist
```

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
        "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Label</key>
    <string>limit.maxfiles</string>
    <key>ProgramArguments</key>
    <array>
      <string>launchctl</string>
      <string>limit</string>
      <string>maxfiles</string>
      <string>262144</string>
      <string>524288</string>
    </array>
    <key>RunAtLoad</key>
    <true/>
    <key>ServiceIPC</key>
    <false/>
  </dict>
</plist>
```

### macOS startup folders

```
/Library/StartUpItems
/Library/LaunchDaemons
/Library/LaunchAgents
/System/Library/StartupItems
/System/Library/LaunchDaemons
/System/Library/LaunchAgents
~/Library/LaunchAgents
```

## DNSMasq and loopalias

TODO

https://github.com/zoltan-nz/playing-with-gitlab#setup-dnsmasq-with-loopback-alias

## Diff So Fancy

https://github.com/so-fancy/diff-so-fancy

