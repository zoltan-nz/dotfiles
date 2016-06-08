# Path to your oh-my-zsh installation.
export ZSH=/Users/szines/.oh-my-zsh

# Save tokens in ~/.env
source ~/.env

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
# ZSH_THEME="random"
ZSH_THEME='robbyrussell'

# obraun
# dieter
# philips

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=31

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
#ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-completions frontend-search rails ruby bower brew compleat git-extras httpie vundle ember-cli npm nvm web-search rbenv fasd colorize colored-man-pages extract)

# User configuration

export PATH="/Users/szines/.bin:/Users/szines/.brew/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='mvim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#

## Aliases
alias vi="vim"
alias zshconfig="vim ~/.zshrc"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias fs="foreman start"
alias gn="git number --column"
alias ga="git number add"
alias vn="git number -c vim"

# On Mac, brew install coreutils
alias ls="gls --color -ah --group-directories-first --sort=extension"
alias lsa="gls --color -lah --group-directories-first --sort=extension"
# On Linux
# alias ls="ls --color -h --group-directories-first"

# Vim with v
alias v="f -e vim"

# Initialization for compinit
autoload -U compinit && compinit

export HOMEBREW_CASK_OPTS="--caskroom=$HOME/.brew/caskroom --binarydir=$HOME/.bin"
export HOMEBREW_GITHUB_API_TOKEN=$HOMEBREW_GITHUB_API_TOKEN

source /Users/szines/.brew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /Users/szines/.brew/opt/zsh-history-substring-search/zsh-history-substring-search.zsh
# git clone git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
source /Users/szines/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

### ==== RBENV ====
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

### === NVM ===
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm

### === PYENV ===
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

fpath=(/Users/szines/.brew/share/zsh-completions /Users/szines/.oh-my-zsh/custom/plugins/zsh-completions /Users/szines/.oh-my-zsh/plugins/git /Users/szines/.oh-my-zsh/functions /Users/szines/.oh-my-zsh/completions /usr/local/share/zsh/site-functions /usr/share/zsh/site-functions /usr/share/zsh/5.0.8/functions /Users/szines/.oh-my-zsh/custom/plugins/zsh-completions/src)

### Android SDK
export ANDROID_HOME=/Users/szines/.brew/opt/android-sdk
