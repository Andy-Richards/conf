
### AR My zsh config without oh-my-zsh 
### There is a nice refernce here - https://github.com/drahosp/dotfiles/blob/master/zshrc
#
### NOTES
#
## Zplug
#	brew insatll zplug
#
## Colorize needs chroma for sytax highlighting. Use `ccat` or `cless` once installed. 
#	brew install chroma
#
## Mvim
#	brew install macvim
#
## Hub - see `man hub'
#	brew install hub 

# Init Zplug - https://github.com/zplug/zplug
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# zsh users
zplug "zsh-users/zsh-completions",              defer:0
zplug "zsh-users/zsh-autosuggestions",          defer:2, on:"zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting",      defer:3, on:"zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-history-substring-search", defer:3, on:"zsh-users/zsh-syntax-highlighting" # https://github.com/zsh-users/zsh-history-substring-search

# oh-my-zsh-plugins
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/zsh-autosuggestions", from:oh-my-zsh
zplug "plugins/colored-man-pages", from:oh-my-zsh
zplug "plugins/colorize", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/docker
zplug "plugins/gcloud", from:oh-my-zsh
zplug "plugins/github", from:oh-my-zsh # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/github
#zplug "plugins/git-prompt", from:oh-my-zsh
zplug "plugins/gradle", from:oh-my-zsh # https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/gradle
#zplug "plugins/helm", from:oh-my-zsh
#zplug "plugins/history", from:oh-my-zsh
#zplug "plugins/kitchen", from:oh-my-zsh
zplug "plugins/kubectl", from:oh-my-zsh
zplug "plugins/kubectx", from:oh-my-zsh
zplug "plugins/tmux", from:oh-my-zsh

## Plugin configurations

## zsh-history-substring-search
# Bind zsh-history-substring-search to the UP/Down key
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

## Docker Plugin
# Enable option staking for docker plugin
zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

## Github Plugin
if (( ! ${fpath[(I)/usr/local/share/zsh/site-functions]} )); then
  FPATH=/usr/local/share/zsh/site-functions:$FPATH
fi

## Zplug 
# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# Then, source plugins and add commands to $PATH
zplug load --verbose

