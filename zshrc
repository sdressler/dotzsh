# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' max-errors 2
zstyle :compinstall filename '/home/sebastian/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
bindkey -e
# End of lines configured by zsh-newuser-install
#

. /usr/share/powerline/zsh/powerline.zsh


export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/.rvm/scripts/rvm
source /etc/profile.d/swarmtools.sh

eval `dircolors ~/.zsh/dircolors-solarized/dircolors.ansi-light`

setopt hist_ignore_dups share_history inc_append_history extended_history
setopt AUTO_CD

alias 'vi=vim'

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# bind UP and DOWN arrow keys (compatibility fallback
# for Ubuntu 12.04, Fedora 21, and MacOSX 10.9 users)
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
