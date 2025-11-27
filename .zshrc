alias vi="nvim"
alias vim="nvim"
alias g="git"
alias tmux="tmux -u"
alias cfg="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

## install zplug

[ ! -d $HOME/.zplug ] && curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh

source $HOME/.zplug/init.zsh

zplug "plugins/git", from:oh-my-zsh
zplug "modules/prompt", from:prezto

if ! zplug check; then
	zplug install
fi

zplug load

prompt nicoulaj

## install mise

if ! which mise > /dev/null 2>&1; then
	curl https://mise.run/zsh | sh
fi

eval "$($HOME/.local/bin/mise activate zsh)" # added by https://mise.run/zsh

export PATH="$PATH:/opt/nvim"

## install direnv

if ! type direnv > /dev/null; then
    curl -sfL https://direnv.net/install.sh | bash
fi
eval "$(direnv hook zsh)"

## install tpm(tmux)

[ ! -d $HOME/.tmux/plugins/tpm ] && git clone https://github.com/tmux-plugins/tpm "$HOME/.tmux/plugins/tpm"

## functions

clear-panes() {
    for _pane in $(tmux list-panes -F '#P'); do
        tmux send-keys -t ${_pane}
    done
}

dev() {
    if [ $# != 0 ]; then
        cd "$1"
    fi
    tmux split-window -h -l 24%
    tmux split-window -v -l 75%
    tmux split-window -v -l 66%
    tmux split-window -v -l 50%
    tmux select-pane -L
    clear-panes
    
    tmux rename-window "$1"
}

deh() {
    if [ $# != 0 ]; then
        cd "$1"
    fi
    tmux split-window -v -l 30%
    tmux split-window -h -l 66%
    tmux split-window -h -l 50%
    tmux select-pane -L
    clear-panes
    
    tmux rename-window "$1"
}
