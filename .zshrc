## zinit installation & initialization

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

## zinit plugins

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

zinit ice as"command" from"gh-r" \
  atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
  atpull"%atclone" src"init.zsh"
zinit light starship/starship
eval "$(starship init zsh)"

zinit as"program" make'!' atclone'./direnv hook zsh > zhook.zsh' \
  atpull'%atclone' pick"direnv" src"zhook.zsh" for direnv/direnv

zinit ice depth=1
zinit light zsh-users/zsh-autosuggestions

## aliases

alias vi="nvim"
alias vim="nvim"
alias g="git"
alias tmux="tmux -u"
alias cfg="git --git-dir=$HOME/.dotfiles --work-tree=$HOME"

## envs

export GOPATH="$HOME/.go"
export GOBIN="$GOPATH/bin"
export CLOUDSDK_PYTHON=python2
export EDITOR=nvim
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk
export PATH="$PATH:$HOME/.local/bin:$HOME/.deno/bin:/usr/local/go/bin:$HOME/.go/bin:$HOME/.anyenv/bin:$HOME/.anyenv/versions/2.6.8/bin:$HOME/.anyenv/envs/nodenv/bin:$HOME/.cargo/bin:/usr/lib/jvm/default/bin:$HOME/.google-cloud-sdk/bin:$HOME/.gsutil/gsutil/:$GOBIN"

## install anyenv

if ! type anyenv > /dev/null; then
  git clone https://github.com/anyenv/anyenv ~/.anyenv
  ~/.anyenv/bin/anyenv install --init
fi
export ANYENV_ROOT="$HOME/.anyenv"
eval "$(anyenv init -)"

if type nodenv > /dev/null; then
    export PATH="$PATH:$(npm bin -g)"
fi

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
        cd "$HOME/Works/$1"
    fi
    tmux split-window -h -p 24
    tmux split-window -v -p 75
    tmux split-window -v -p 66
    tmux split-window -v -p 50
    #tmux split-window -h -p 50
    tmux select-pane -L
    clear-panes
    
    tmux rename-window "$1"
}

deh() {
    if [ $# != 0 ]; then
        cd "$HOME/Works/$1"
    fi
    tmux split-window -v -p 30
    tmux split-window -h -p 66
    tmux split-window -h -p 50
    #tmux split-window -h -p 50
    tmux select-pane -L
    clear-panes
    
    tmux rename-window "$1"
}
