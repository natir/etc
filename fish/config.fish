# remove welcome message
set -U fish_greeting ""

# load ssh key
fish_ssh_agent

# alias
alias ls="eza"
alias cat="bat"
alias find="fd"
alias ll="ls -la"
alias rm="rm -i"
alias cp="cp -ip"
alias mv="mv -i"

function upgrade
    sudo /usr/bin/dnf upgrade
    flatpak update -u
    rustup update
    cargo install-update --all
    pipx upgrade-all
end

# set some basic value
set -gx EDITOR /usr/bin/vim

# set path
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.pixi/bin
fish_add_path $HOME/.pyenv/bin
fish_add_path $HOME/.cargo/bin

# load rust
source $HOME/.cargo/env.fish

# load pyenv
pyenv init - fish | source

# start starship prompt
starship init fish | source
