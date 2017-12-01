export ZSH=/Users/sathyanarayanravi/.oh-my-zsh

ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='nerdfont-complete'

# Add new line
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon dir)

POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(vcs root_indicator background_jobs_joined)
POWERLEVEL9K_STATUS_VERBOSE=false

# Omit the ~ and the ...
POWERLEVEL9K_DIR_OMIT_FIRST_CHARACTER=true

# Show only last three directories
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_folders

# Put > icon as the path separator
POWERLEVEL9K_DIR_PATH_SEPARATOR=" $(print $'\uE0B1') "

# Colors

# Directory
POWERLEVEL9K_OS_ICON_BACKGROUND="241"
POWERLEVEL9K_OS_ICON_FOREGROUND="223"

POWERLEVEL9K_DIR_HOME_BACKGROUND="142"
POWERLEVEL9K_DIR_HOME_FOREGROUND="237"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_BACKGROUND="142"
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND="237"

POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='214'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='237'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='214'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='237'

POWERLEVEL9K_BACKGROUND_JOBS_BACKGROUND='241'
POWERLEVEL9K_BACKGROUND_JOBS_FOREGROUND='223'

# Git

POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind git-stash git-remotebranch)

# Show last commit hash
POWERLEVEL9K_SHOW_CHANGESET='true'
POWERLEVEL9K_CHANGESET_HASH_LENGTH='7'

# Icons
POWERLEVEL9K_VCS_COMMIT_ICON='\uE626 '
POWERLEVEL9K_VCS_STAGED_ICON='\u271A'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uF113 '
POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON='\uF171 '

HYPHEN_INSENSITIVE="true"

HIST_STAMPS="dd.mm.yyyy"

# Plugins
plugins=(git wd sudo npm web-search docker macports brew node zsh-autosuggestions)

# User configuration

source $ZSH/oh-my-zsh.sh

# Might need to manually set the language environment
#export LANG=en_US.UTF-8

# Personal aliases
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"

alias lah="ls -lah"

alias vim=nvim

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='/urs/local/bin/vim'
else
  export EDITOR='vim'
fi


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# NVM
export NVM_DIR="/Users/sathyanarayanravi/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

# Ruby
export PATH=/Users/sathyanarayanravi/.rvm/gems/ruby-2.4.0/bin:/Users/sathyanarayanravi/.rvm/gems/ruby-2.4.0@global/bin:/Users/sathyanarayanravi/.rvm/rubies/ruby-2.4.0/bin:/Users/sathyanarayanravi/.rvm/bin

# Node
export PATH=/Users/sathyanarayanravi/.nvm/versions/node/v6.3.1/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin

# Clojure
export PATH=$PATH:/Applications/clojure

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/platform-tools

# RVM, Make sure this is last path change (dont exactly know why)
export PATH="$PATH:$HOME/.rvm/bin"

source ~/.fonts/*.sh

