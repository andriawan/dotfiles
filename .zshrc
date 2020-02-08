# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=~/Library/Android/sdk/tools:$PATH
export PATH=~/Library/Android/sdk/platform-tools:$PATH 

# Path to your oh-my-zsh installation.
export ZSH="/Users/andriawan/.oh-my-zsh"
export LC_CTYPE="en_US.UTF-8"
export EDITOR="vim"
export ZPLUG_HOME=~/.zplug

# nvm config
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

if [ ! -d "$ZSH" ];then
    echo "Installing oh-my-zsh in $ZSH"
    curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | zsh
fi

if [  ! -d "$ZPLUG_HOME" ] && [ -f "$ZSH/oh-my-zsh.sh"  ];then
    echo "Installing zplug in $ZPLUG_HOME"
    curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
fi

ZSH_DISABLE_COMPFIX=true

# zsh-plug init 
source $ZPLUG_HOME/init.zsh
# source $ZSH/oh-my-zsh.sh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# do self-manage
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# from oh-my-zsh
zplug "lib/completion",             from:oh-my-zsh
zplug "lib/directories",            from:oh-my-zsh
zplug "lib/git",                    from:oh-my-zsh
zplug "lib/history",                from:oh-my-zsh
zplug "lib/key-bindings",           from:oh-my-zsh
zplug "plugins/emoji",              from:oh-my-zsh
zplug "plugins/git",                from:oh-my-zsh
zplug "plugins/github",             from:oh-my-zsh
zplug "plugins/yarn",               from:oh-my-zsh
zplug "plugins/fzf",                from:oh-my-zsh
zplug "plugins/yarn",               from:oh-my-zsh
zplug "plugins/vim-interaction",    from:oh-my-zsh
zplug "plugins/colorize",           from:oh-my-zsh
zplug "plugins/systemd",            from:oh-my-zsh

# for add new zplug "lib/", from:oh-my-zsh

# zsh-plugin
zplug "geometry-zsh/geometry",              from:github, as:theme
zplug "mafredri/zsh-async",                 from:github, use:async.zsh
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-syntax-highlighting" 
# auto-close quotes and brackets like a pro
zplug 'hlissner/zsh-autopair'              

zplug check || zplug install 
zplug load 

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

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
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)
plugins=(zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true

# alias section

#diskusage
alias usage='du -chsx * | sort -rh | head'
alias ducks='du -cks * | sort -rn | head'

#commit count git
alias gitcc='git log --oneline --all | wc -l'

alias cls='clear'
alias xampp_start='sudo /Applications/XAMPP/xamppfiles/xampp start'
alias xampp_stop='sudo /Applications/XAMPP/xamppfiles/xampp stop'


fpath=($(brew --prefix)/share/zsh-completions $fpath)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
