# Created by newusr for 5.9
source /usr/share/zsh-antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle lein
antigen bundle command-not-found

# Syntax highlighting bundle.
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle hcgraf/zsh-sudo
antigen bundle rupa/z

# Load the theme.
# antigen theme ys
antigen theme af-magic
# Tell Antigen that you're done.
antigen apply

if [[ $TMUX != "" ]] then
    export TERM="tmux-256color"
else
    export TERM="xterm-256color"
fi

export GDK_SCALE=2

export PATH="/snap/bin/:$HOME/.config/nvim:$HOME/.local/share/nvim/mason/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cargo/bin:$PATH"
# export PATH="$HOME/.config/nvim:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$HOME/.cargo/bin:$PATH"

source ~/.VCS/Liscen/VCS_Env
