# Zoltan's Dotfiles

- [Zoltan's Dotfiles](#zoltans-dotfiles)
  - [macOS Setup](#macos-setup)
    - [Install softwares](#install-softwares)
    - [Setup git](#setup-git)
    - [Setup ssh](#setup-ssh)
    - [Install brew and additional packages](#install-brew-and-additional-packages)
    - [Setup dotfiles in your home folder](#setup-dotfiles-in-your-home-folder)
    - [Install fonts](#install-fonts)
    - [Install `fzf`](#install-fzf)
    - [Language support](#language-support)
      - [Install Python](#install-python)
      - [Install Ruby](#install-ruby)
      - [Install Rust](#install-rust)
      - [Install Node.js with fnm](#install-nodejs-with-fnm)
      - [Install Deno](#install-deno)
      - [Install SDK-MAN for Java support](#install-sdk-man-for-java-support)
      - [Setup Shell Session Limits on Mac](#setup-shell-session-limits-on-mac)
    - [Optional setup](#optional-setup)
      - [Use `diff-so-fancy` for formatting `git diff` output](#use-diff-so-fancy-for-formatting-git-diff-output)
      - [DNSMasq and loopalias](#dnsmasq-and-loopalias)
  - [Ubuntu specific setup](#ubuntu-specific-setup)
  - [Notes](#notes)
    - [macOS startup folders](#macos-startup-folders)

## macOS Setup

### Install softwares

- [`Chrome`](https://www.google.com/chrome/)
- [`JetBrains ToolBox`](https://www.jetbrains.com/toolbox-app/)
- [`Visual Studio Code`](https://code.visualstudio.com/)
- [`Rectangle`](https://rectangleapp.com/)
- [`iTerm2`](https://www.iterm2.com/)
- [`XCode`](https://apps.apple.com/us/app/xcode/id497799835?mt=12)

### Setup git

```bash
git config --global user.name 'Your Name'
git config --global user.email 'your@email.address'
git config --global core.excludesfile ~/.gitignore
git config --global pager.branch false
echo ".idea\n.DS_Store\nnode_modules" > ~/.gitignore
```

### Setup ssh

- [Setup ssh keys](https://help.github.com/articles/generating-a-new-ssh-key-and-adding-it-to-the-ssh-agent/)
- Add to [GitHub](https://github.com), [GitLab](https://gitlab.com), [Bitbucket](https://bitbucket.com)

```bash
pbcopy < ~/.ssh/id_rsa.pub
```

### Install brew and additional packages

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Install `mc`, `xz`, `rbenv`, `pyenv`, `go`, `htop`, `coreutils`, `fnm`, `fsf`, `tmux`, `direnv`, `zoxide`

```
brew install mc xz rbenv pyenv go htop coreutils fnm fsf tmux direnv zoxide
brew tap homebrew/cask-fonts
brew install --cask font-victor-mono
```

### Setup dotfiles in your home folder

Clone this repository in `~/projects/dotfiles`

```bash
mkdir ~/projects
git clone git@github.com:zoltan-nz/dotfiles.git ~/projects/dotfiles --recurse-submodules
```

Update submodules

```bash
cd ~/projects/dotfiles
git submodule update --recursive --remote
```

Symlink the following files:

```bash
ln -s ~/projects/dotfiles/dotfiles/vimrc ~/.vimrc &&
ln -s ~/projects/dotfiles/dotfiles/zshrc ~/.zshrc &&
ln -s ~/projects/dotfiles/dotfiles/gemrc ~/.gemrc &&
cp ~/projects/dotfiles/dotfiles/zshrc.local.template ~/.zshrc.local
```

Zsh is the default shell in macOS Catalina, so this step can be skipped. In previous macOS versions change the default shell to `/bin/zsh` manually. System Preferences > Users and Groups > Authenticate > Right click on user name > Advance Options. Change the login shell to `/bin/zsh`.

### Install zoxide

Zoxide is for replacing `fasd`.

```bash
brew install zoxide
```

### Install fonts

Drag and drop fonts files in Font Book.

### Install `fzf`

What is `fzf`? [A command-line fuzzy finder](https://github.com/junegunn/fzf).

```bash
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
```

### Language support

#### Install Python

Use `uv`

https://docs.astral.sh/uv/getting-started/installation/

```
curl -LsSf https://astral.sh/uv/install.sh | sh
```

```
uv python install
```

#### Install Ruby

```bash
rbenv install --list
rbenv install 3.0.0
rbenv global 3.0.0
```

#### Install Rust

- [Rust installation](https://doc.rust-lang.org/book/ch01-01-installation.html)

```
curl --proto '=https' --tlsv1.2 https://sh.rustup.rs -sSf | sh
```

#### Install Node.js with fnm

Follow the best tutorial about [Installing Node.js with Yarn](https://yoember.com/nodejs/the-best-way-to-install-node-js-with-yarn/).

```
fnm list-remote
fnm install 15.5.0
fnm use 15.5.0
fnm default 15.5.0
```

#### Install Deno

- [Deno installation](https://deno.land/manual/getting_started/installation)

```
cargo install deno
```

#### Install SDK-MAN for Java support

<https://sdkman.io/>

```bash
curl -s https://get.sdkman.io | zsh
sdk install java 15.0.1.j9-adpt
```

#### Setup Shell Session Limits on Mac

- Source: [Shell Session Limit - Stackoverflow](https://unix.stackexchange.com/questions/108174/how-to-persistently-control-maximum-system-resource-consumption-on-mac?answertab=votes#tab-top)
- Temporary solution is using `ulimit`.
- Permanent solution is creating a `LaunchDaemon`.

```shell
<<EOF | sudo tee /Library/LaunchDaemons/limit.maxfiles.plist > /dev/null && sudo chown root:wheel /Library/LaunchDaemons/limit.maxfiles.plist
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN"
        "http://www.apple.com/DTDs/PropertyList-1.0.dtd"\>
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
EOF
```

### Optional setup

#### Fix holding down a key not repeating problem in macOS

```bash
defaults write -g ApplePressAndHoldEnabled -bool false
```

#### Use `diff-so-fancy` for formatting `git diff` output

[Diff So Fancy repository](https://github.com/so-fancy/diff-so-fancy)

```bash
yarn global add diff-so-fancy && git config --global core.pager "diff-so-fancy | less --tabs=4 -RFX"
```

#### DNSMasq and loopalias

DNSMasq and loopalias in more detail: https://github.com/zoltan-nz/playing-with-gitlab#setup-dnsmasq-with-loopback-alias

## Ubuntu specific setup

Prerequisites on Ubuntu for installing Python ([source](https://github.com/pyenv/pyenv/wiki/common-build-problems)).

```bash
sudo apt-get install -y make build-essential libssl-dev zlib1g-dev libbz2-dev \
libreadline-dev libsqlite3-dev wget curl llvm libncurses5-dev libncursesw5-dev \
xz-utils tk-dev libffi-dev liblzma-dev python-openssl git
```

## Notes

### macOS startup folders

```text
/Library/StartUpItems
/Library/LaunchDaemons
/Library/LaunchAgents
/System/Library/StartupItems
/System/Library/LaunchDaemons
/System/Library/LaunchAgents
~/Library/LaunchAgents
```
