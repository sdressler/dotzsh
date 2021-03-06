
# Autostart TMUX
ZSH_TMUX_AUTOSTART=true

# PROMPT SETTINGS
DEFAULT_USER="sebastian" #@Sebastians-MacBook-Pro"
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context time dir)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs vcs)

export LC_ALL=en_US.UTF-8 
export LANG=en_US.UTF-8

export JIRA_URL=http://jira.swarm64.com

#export PYENV_ROOT=/usr/local/var/pyenv
#export PATH=$PYENV_ROOT/bin:$PATH
#eval "$(pyenv init -)"

# DOCKER
#eval "$(docker-machine env dev)"
#eval "$(dinghy env)"

source ~/.zsh/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

antigen bundle git
antigen bundle brew
antigen bundle docker
antigen bundle jira
antigen bundle sudo
antigen bundle tmux
antigen bundle encode64

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions

# Load the theme.
#antigen theme bira
antigen theme bhilburn/powerlevel9k powerlevel9k

antigen apply

# Aliases
alias docker-run='docker run --rm -i -t -v `pwd`:/tmp/work -w /tmp/work'
alias docker-run-hw='docker-run -e VM_NO_LOADS=1 dev'
alias vi='vim'
alias docker-display='socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"'

# Set tmux pane name when SSH'ing
ssh() {
    if [ "$(ps -p $(ps -p $$ -o ppid=) -o comm=)" = "tmux" ]; then
        tmux rename-window "$(echo $* | cut -d . -f 1)"
        command ssh "$@"
        tmux set-window-option automatic-rename "on" 1>/dev/null
    else
        command ssh "$@"
    fi
}

# powerline-config tmux setup

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

