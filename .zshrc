# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="miloshadzic"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin
alias ggoback='git reset --hard HEAD~'
alias gca='git commit -a'
alias gco='git checkout'
alias gst='git status'
alias gp='/usr/bin/com.sh'
alias gl='git pull; /usr/bin/gsmu.pl'
alias gsmu='git submodule update'
alias glgsmu='gsmu | gl'
alias gcam='git commit -a -m '
alias gragerevert='git reset --hard'
alias grev='git rev-parse HEAD'
alias gchanges='git log --branches --not --remotes --oneline'
alias gcheck='git diff ...origin | git fetch | sublime -w'
alias grb='git rebase origin master'
alias grevdate='/usr/bin/rev.sh'
alias fucking='sudo'
alias ffs='ffs.pl'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
export PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export PATH="/usr/local/bin:$PATH"
export PATH="/Applications/Postgres.app/Contents/MacOS/bin:$PATH"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"  # This loads RVM into a shell session.