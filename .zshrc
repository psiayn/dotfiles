# POWERLEVEL10k
# {{{
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
# }}}

# ZSH go brr
# {{{
# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/$HOME/.gem/ruby/2.7.0/bin:$HOME/fuchsia/.jiri_root/bin:$HOME/.ghcup/bin:$HOME/.ghcup/env:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/psiayn/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh
# }}}

# Custom configs
# {{{
set foldmethod=indent

export FUCHSIA_DIR="~/fuchsia"


alias newvim="~/bin/bin/nvim"

export EDITOR="$newvim"

# alias configs
alias xmoconf="newvim ~/.xmonad/xmonad.hs"
alias zshconf="newvim ~/.zshrc"
alias dwmconf="cd ~/clones/dwm && newvim config.h"
alias dwmscript="newvim ~/.config/startup.sh"
alias nvimconf="newvim ~/.config/nvim/init.vim"
alias sxhkdconf="newvim ~/.config/sxhkd/sxhkdrc"
alias ssh="kitty +kitten ssh"

# }}}

# P10k p2
# {{{
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
[ -f "/home/psiayn/.ghcup/env" ] && source "/home/psiayn/.ghcup/env" # ghcup-env
# }}}

# Blur in yakuake or kitty
# {{{
if [[ $(ps --no-header -p $PPID -o comm) =~ '^yakuake|kitty$' ]]; then
        for wid in $(xdotool search --pid $PPID); do
            xprop -f _KDE_NET_WM_BLUR_BEHIND_REGION 32c -set _KDE_NET_WM_BLUR_BEHIND_REGION 0 -id $wid; done
fi
# }}}

# pyenv
# {{{
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
# }}}
