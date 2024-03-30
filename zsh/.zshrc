# Default Config for JAVLOCAN

export PATH=~/.local/bin:$PATH

APP_DIR="/usr/share"
PLUGINS_DIR="${APP_DIR}/zsh/plugins"
export EDITOR=vi
KEYTIMEOUT=1

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi

# colors
zstyle ':completion:*' list-colors ''

# cool stuff to have
setopt AUTOCD

# save history pleeeease
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=~/.zsh_history
SAVEHIST=9999
HISTSIZE=10000
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# fixing some keybindings bug in zsh
bindkey "\e[1~" beginning-of-line
bindkey "\e[4~" end-of-line
bindkey "\e[5~" beginning-of-history
bindkey "\e[6~" end-of-history
bindkey "\e[3~" delete-char
bindkey "\e[2~" quoted-insert
bindkey "\e[5C" forward-word
bindkey "\eOc" emacs-forward-word
bindkey "\e[5D" backward-word
bindkey "\eOd" emacs-backward-word
bindkey "\ee[C" forward-word
bindkey "\ee[D" backward-word

# completions
autoload -U compinit; compinit

# plugins
source "${PLUGINS_DIR}/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
source "${PLUGINS_DIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh"
source "${PLUGINS_DIR}/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh"
source "${PLUGINS_DIR}/zsh-thefuck-git/zsh-thefuck.plugin.zsh"
source "/usr/share/fzf/completion.zsh"
source "/usr/share/fzf/key-bindings.zsh"


# aliases
alias vim="nvim"
alias ls="lsd"
alias lss="lsd --tree --depth=2 -a"
alias k="kubectl"

alias gst="git status"
alias gss="git status --short"
alias ga.="git add . && git status --short"
alias ga..="git add ../ && git status --short"
alias gau="git add -u"
alias gcm="git commit -m"
alias gcma="git commit --amend -m"
alias gco="git checkout"
alias gpl="git pull"
alias gplr="git pull --rebase"
alias gplrc="git rebase --continue"
alias gps="git push"
alias gpsuo="git push --set-upstream origin"
alias gdf="git diff"

# prompt
source "$HOME/.config/zsh/purs_setup"
