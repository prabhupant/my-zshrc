# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
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
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions)

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

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

VISUAL=vim; export VISUAL EDITOR=vim; export EDITOR

alias venv='source venv/bin/activate'
alias run='python3 manage.py runserver'
alias shell='python3 manage.py shell'
alias ..="cd .."
alias ...="cd ../.."
alias .3="cd ../../.."
alias .4="cd ../../../.."
alias .5="cd ../../../../.."
alias .6="cd ../../../../../.."
alias pspy='ps -aux | grep python'
alias today='date +"%A, %B %-d, %Y"; echo " "; cal'
alias work='cd ~/Work'
alias ll="ls -lath"

alias format='mvn spring-javaformat:apply'
alias mspr='mvn spring-boot:run'

alias work="cd ~/work"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
#export SDKMAN_DIR="$HOME/.sdkman"
#[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Tmux color issues with zsh
export TERM=xterm-256color

# Check if there are any unresolved merge conflicts
alias resolved='git diff -S "<<<<<<< HEAD" -S "=======" -S ">>>>>>> $(git name-rev --name-only MERGE_HEAD)" HEAD'

# Spring related life savers
alias format='mvn spring-javaformat:apply'
alias ma='java -jar -XX:MetaspaceSize=256M -XX:MaxMetaspaceSize=256M -Xms1280m -Xmx1280m -Xmn256m -Xss512k -XX:+UseG1GC -XX:+HeapDumpOnOutOfMemoryError -XX:HeapDumpPath=/tmp -Duser.timezone=Asia/Kolkata -Duser.timezone=Asia/Kolkata'
alias mcid='mvn clean install -DskipTests'
alias mci='mvn clean install'
alias mcis='mvn clean install -Dcheckstyle.skip'
alias springrun='mvn spring-boot:run'

function pgstart() {
    docker run -d \
      --name dev-postgres \
      -e POSTGRES_USER=${PG_USER} \
      -e POSTGRES_PASSWORD=${PG_PASSWD} \
      -v ${HOME}/servce-dir/:/var/lib/postgresql/data \
      -p ${PG_LOCAL_PORT}:${PG_PORT} \
      postgres:12.4
}

function pgadstart() {
    docker run --name dev-pgadmin \
      -e "PGADMIN_DEFAULT_EMAIL=" \
      -e "PGADMIN_DEFAULT_PASSWORD=" \
      -p 5480:80 \
      -d dpage/pgadmin4:5.6
}

# Set python path to the base of working directory
function setpypa() {
  export PYTHONPATH=.:$HOME/<dir-base>:${PYTHONPATH}
}

export PATH=/usr/local/opt/m4/bin:/usr/local/opt/openjdk@11/bin:/usr/local/bin/:$PATH
export JAVA_HOME=$(/usr/libexec/java_home)

# Open ranger in the current directory
function ranger {
    local IFS=$'\t\n'
    local tempfile="$(mktemp -t tmp.XXXXXX)"
    local ranger_cmd=(
        command
        ranger
        --cmd="map Q chain shell echo %d > "$tempfile"; quitall"
    )

    ${ranger_cmd[@]} "$@"
    if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
        cd -- "$(cat "$tempfile")" || return
    fi
    command rm -f -- "$tempfile" 2>/dev/null
}

# Mac M1 related docker issues
export DOCKER_BUILDKIT=0
export COMPOSE_DOCKER_CLI_BUILD=0

alias renumber='tmux movew -r'

# Uncomment below three lines if faced with SSL issues with urllib
# CERT_PATH=$(python3 -m certifi)
# export SSL_CERT_FILE=${CERT_PATH}
# export REQUESTS_CA_BUNDLE=${CERT_PATH}

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi
