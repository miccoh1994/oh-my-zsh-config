ZSH_THEME="lima-agnoster"

precmd () { print -Pn "\e]2; %~\a" } # title bar prompt
DISABLE_AUTO_TITLE="true"
config_dir="`dirname $0`"
## plugins
plugins=(
    git
    web-search
    sudo
)
source $config_dir/plugins/kill-node.zsh