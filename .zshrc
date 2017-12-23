# IMPORTANT!
# Copy ./.zshrc.local to ~/.zshrc.local and setup your environment variables

# Import your local profile file
[ -s ~/.zshrc.local ] && source ~/.zshrc.local
DOTFILES=${DOTFILES:-$HOME/projects/dotfiles}

export PATH="$HOME/.bin:$HOME/.brew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:$PATH"

########################
# --- ZSH SETTINGS --- #
########################

export ZSH=$DOTFILES/zsh/oh-my-zsh
export ZSH_CUSTOM=$DOTFILES/zsh/custom

ZSH_THEME=${LOCAL_ZSH_THEME:-agnoster}
HYPHEN_INSENSITIVE="true"
DISABLE_AUTO_UPDATE="true"
COMPLETION_WAITING_DOTS="true"
DISABLE_UNTRACKED_FILES_DIRTY="true"
ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"

# --- ZSH PLUGINS ---

plugins=(git zsh-completions zsh-autosuggestions fasd tmux docker go)

# Comments for plugins
# zsh-completions - https://github.com/zsh-users/zsh-completions
# zsh-autosuggestions - git://github.com/zsh-users/zsh-autosuggestions
# httpie - https://github.com/jkbrzt/httpie
# fasd - https://github.com/clvv/fasd

source $ZSH/oh-my-zsh.sh

# zsh-syntax-highlighting - https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md
source $ZSH_CUSTOM/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# https://github.com/zsh-users/zsh-history-substring-search
source $ZSH_CUSTOM/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# --- ZSH Completions plugin ---

# https://github.com/zsh-users/zsh-completions
# autoload -U compinit && compinit

######################
#        ALIAS       #
######################

# This must have for a proper color support in old gnome-terminal!!! And don't change global TERM!!!
alias tmux="TERM=xterm-256color tmux attach || tmux new"

alias zshconfig="vim $DOTFILES/.zshrc"
alias vimconfig="vim $DOTFILES/.vimrc"

alias fs="foreman start"

# On Mac, please `brew install coreutils`
if [ "$(uname)" = "Darwin" ]; then
  alias ls="gls --color -ah --group-directories-first --sort=extension"
  alias lsa="gls --color -lah --group-directories-first --sort=extension"
elif [ "$(expr substr $(uname -s) 1 5)" = "Linux" ]; then
  # On Linux
  alias ls="ls --color -h --group-directories-first"
fi

# Vim with v; f installed by fasd
alias v="f -e vim"
alias gv="fasd -e mvim"

alias gsa="git submodule add "

alias c="clear"
alias x="exit"

# alias markd="(pid=\`cat /tmp/grip.pid\`;kill $pid;grip > /dev/null 2>1  &;echo $! > /tmp/grip.pid;open http://localhost:6419)"

# Load local alias file if exists
[ -s "$HOME/.alias" ] && source ~/.alias

### === HOMEBREW ===

# Install homebrew in your home folder ~/.brew

# export HOMEBREW_CASK_OPTS="--caskroom=$HOME/.brew/caskroom --binarydir=$HOME/.bin"
export HOMEBREW_GITHUB_API_TOKEN=$HOMEBREW_GITHUB_API_TOKEN

### ==== RBENV ====

# curl https://raw.githubusercontent.com/fesplugas/rbenv-installer/master/bin/rbenv-installer | bash
# git clone https://github.com/sstephenson/ruby-build ~/.rbenv/plugins/ruby-build
export RBENV_ROOT="${HOME}/.rbenv"
if [ -d "${RBENV_ROOT}" ]; then
  export PATH="${RBENV_ROOT}/bin:${PATH}"
  eval "$(rbenv init -)"
fi

export RUBYGEMS_GEMDEPS=_

### === NVM ===

# git clone https://github.com/creationix/nvm ~/.nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

# Copy the actual nvm node to system folder
# alias nvmcopysystem="n=$(which node);n=${n%/bin/node}; chmod -R 755 $n/bin/*; sudo cp -r $n/{bin,lib,share} /usr/local"

# Automatically switch to the supported node version whenever entering a directory that contains an .nvmrc file
# place this after nvm initialization!
# autoload -U add-zsh-hook
load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

# add-zsh-hook chpwd load-nvmrc
load-nvmrc

### === PYENV ===

# curl -L https://raw.githubusercontent.com/yyuu/pyenv-installer/master/bin/pyenv-installer | bash
export PYENV_ROOT="${HOME}/.pyenv"
if [ -d "${PYENV_ROOT}" ]; then
  export PATH="${PYENV_ROOT}/bin:$PATH"
  eval "$(pyenv init -)"
  # eval "$(pyenv virtualenv-init -)"
fi

### === GOLANG ===

export GOPATH=$HOME/projects/go
export PATH=$PATH:$HOME/.brew/opt/go/libexec/bin:$GOPATH/bin

# Binding Alt+left and Alt+right jumping words
# bindkey -e
# if [ "$TERM" =~ "^xterm" ]; then
#   bindkey '^[^[[D' backward-word
#   bindkey '^[^[[C' forward-word
# elif [ "$TERM" =~ "^screen" ]; then
#   bindkey '^[[1;3D' backward-word
#   bindkey '^[[1;3C' forward-word
# fi

# infocmp $TERM | sed 's/kbs=^[hH]/kbs=\\177/' > ~/.$TERM.ti
# tic ~/.$TERM.ti
