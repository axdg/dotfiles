# Path to your oh-my-zsh installation.
export ZSH=/Users/agimenez/.oh-my-zsh

# Theme
ZSH_THEME="lambda"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

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
plugins=(git)

# USER CONFIGURATION

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Alias some configs
alias zshconfig="sudo nano ~/.zshrc"
alias npmconfig="sudo nano ~/.npmrc"
alias nvmconfig="sudo nano ~/.nvmrc"
# alias pipconfig="sudo nano ~/Library/Application\ Support/pip/pip.conf"

# Updating alias for this config source
alias zsource="source ~/.zshrc"

# Switch to dev dirs quickly
alias oss="cd ~/Desktop/active_os"
alias css="cd ~/Desktop/active_cs"

# Hack the PATH variable to use PHP7.1 (makes me sad inside)
export PATH=/usr/local/php5/bin:$PATH

# nmv hook to find a `.nvmrc`
export NVM_DIR="/Users/agimenez/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"

# Respect .nvmrc files with a shell hook
autoload -U add-zsh-hook
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

# Init the NVM hook above - and silence output
add-zsh-hook chpwd load-nvmrc
load-nvmrc &> /dev/null

# Go support
export GOPATH=$HOME/.go
export PATH=$PATH:/usr/local/opt/go/libexec/bin
alias gopath="cd $GOPATH"

# Julia support

#     _       _ _(_)_     |  A fresh approach to technical computing
#    (_)     | (_) (_)    |  Documentation: https://docs.julialang.org
#     _ _   _| |_  __ _   |  Type "?help" for help.
#    | | | | | | |/ _` |  |
#    | | |_| | | | (_| |  |  Version 0.6.0 (2017-06-19 13:05 UTC)
#   _/ |\__'_|_|_|\__'_|  |  Official http://julialang.org/ release
#  |__/                   |  x86_64-apple-darwin13.4.0

# You could also symlink - run;
# sudo ln -s /Applications/Julia-0.6.app/Contents/Resources/julia/bin/julia /usr/bin/julia
export PATH="/Applications/Julia-0.6.app/Contents/Resources/julia/bin:$PATH"

# Set the `JUPYTER` env var for IJulia to find during install / update
# See `https://github.com/JuliaLang/IJulia.jl`
export JUPYTER=/usr/local/bin/jupyter

#               .?77777777777777$.
#               777..777777777777$+
#              .77    7777777777$$$
#              .777 .7777777777$$$$
#              .7777777777777$$$$$$
#              ..........:77$$$$$$$
#       .77777777777777777$$$$$$$$$.=======.
#      777777777777777777$$$$$$$$$$.========
#      777777777777777$$$$$$$$$$$$$.=========
#      7777777777777$$$$$$$$$$$$$$$.=========
#      77777777777$$$$$$$$$$$$$$$$ :========+.
#      7777777777$$$$$$$$$$$$$$+..=========++~
#      77777777$$..~=====================+++++
#      7777777$~.~~~~=~=================+++++.
#      77777$$$.~~~===================+++++++.
#      7777$$$$.~~==================++++++++:
#      7$$$$$$$.==================++++++++++.
#      .,$$$$$$.================++++++++++~.
#              .=========~.........
#              .=============++++++
#              .===========+++..+++
#              .==========+++.  .++
#               ,=======++++++,,++,
#               ..=====+++++++++=.
#      				 ..~+=...

# Set the `PYTHON` env var for PyPlot for Julia to find
# See `https://github.com/JuliaPy/PyPlot.jl`
export PYTHON=/usr/local/bin/python3

# Quickly set the virtualenv
alias venv="css && . ./penv/bin/activate"

# Jupyter's `jupyter notebook` does not have tab completion
alias notebook="jupyter notebook"

# Ruby and rbenv
# export PATH="$HOME/.rbenv/bin:$PATH

# A bunch of gcloud stuff follows;
# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/agimenez/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/agimenez/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/agimenez/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/agimenez/google-cloud-sdk/completion.zsh.inc'; fi

# Google Cloud Functions emulator - it's pinned to a node version.
alias functions="functions-emulator"

# Set the default application credentials (gcloud) - for running GCP apps locally.
export GOOGLE_APPLICATION_CREDENTIALS="/Users/agimenez/gcloud-service-key.json"

# Generate a uuid using `hex` - or you could also use `uuidgen`.
alias uuid="python -c 'import sys,uuid; sys.stdout.write(uuid.uuid4().hex)' | pbcopy && pbpaste && echo"

# Generate an ISO 8601 timestamp @ UTC.
alias ts node -e 'console.log(new Date().toISOString())' | tee >(pbcopy)

# Inkscape CLI tools (commented out, since symlinked instead)
# alias inkscape="/Applications/Inkscape.app/Contents/Resources/bin/inkscape"
# ln -s /Applications/Inkscape.app/Contents/Resources/bin/inkscape /usr/local/bin

# Echo a header:
echo "
 /**
  * ==================================== >
  * == axdg == <axdg@dfant.asia> ======= >
  * ==================================== >
  * ==================================== >
  * == hello adrian... you're really === >
  * ==================================== >
  * == good at turning me on ;) ======== >
  * ==================================== >
  */
"
