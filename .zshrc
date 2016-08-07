# IMPORTANT!
# Copy ./.profile_template to ~/.profile and setup your environment variables

# Import your local profile file
[ -s ~/.profile ] && source ~/.profile
DOTFILES=${DOTFILES:-$HOME/projects/dotfiles}

export PATH="/Users/szines/.bin:/Users/szines/.brew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
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
ZSH_TMUX_AUTOSTART="true"
ZSH_AUTOSUGGEST_STRATEGY="match_prev_cmd"

# --- ZSH PLUGINS ---

plugins=(git zsh-completions zsh-autosuggestions rails git-extras httpie npm nvm web-search rbenv pyenv fasd colored-man-pages tmux zsh-syntax-highlighting)

# Comments for plugins
# zsh-completions - https://github.com/zsh-users/zsh-completions
# zsh-autosuggestions - git://github.com/zsh-users/zsh-autosuggestions
# httpie - https://github.zohttps://github.com/jkbrzt/httpie
# fasd - https://github.com/clvv/fasd
# zsh-syntax-highlighting - https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md

source $ZSH/oh-my-zsh.sh

# https://github.com/zsh-users/zsh-history-substring-search
source $ZSH_CUSTOM/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# --- ZSH Completions plugin ---

# https://github.com/zsh-users/zsh-completions
autoload -U compinit && compinit

######################
#        ALIAS       #
######################

alias vi="vim"

alias zshconfig="vim $DOTFILES/.zshrc"

alias fs="foreman start"hello

alias gn="git number --column"
alias ga="git number add"
alias vn="git number -c vim"
alias gv="fasd -e mvim"

# On Mac, brew install coreutils
alias ls="gls --color -ah --group-directories-first --sort=extension"
alias lsa="gls --color -lah --group-directories-first --sort=extension"
# On Linux
# alias ls="ls --color -h --group-directories-first"

# Vim with v, f comes from fasd
alias v="f -e vim"

alias gsa="git submodule add "

alias c="clear"
alias e="exit"

# Load local alias file if exists
[ -s "$HOME/.alias" ] && source ~/.alias

# --- HOMEBREW ---
# Install homebrew in your home folder ~/.brew

export HOMEBREW_CASK_OPTS="--caskroom=$HOME/.brew/caskroom --binarydir=$HOME/.bin"
export HOMEBREW_GITHUB_API_TOKEN=$HOMEBREW_GITHUB_API_TOKEN


### ==== RBENV ====
eval "$(rbenv init -)"

### === NVM ===
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

### === PYENV ===
export PYENV_ROOT="$HOME/.pyenv"
eval "$(pyenv init -)"

### Android SDK
export ANDROID_HOME=$HOME/.brew/opt/android-sdk

# Binding Alt+left and Alt+right jumping words
bindkey -e
bindkey '^[^[[D' backward-word
bindkey '^[^[[C' forward-word

export PATH="$HOME/.rbenv/bin:$PATH"
export PATH="$PYENV_ROOT/bin:$PYENV_ROOT/shims:$PATH"
