# Remove greeting
set fish_greeting

# Initialize Starship
starship init fish | source

# Some useful settings
set -gx EDITOR nvim
set -gx LANG en_US.UTF-8

# Aliases
alias ll="ls -lh --color=auto"
alias la="ls -lha --color=auto"

# tmux auto-start (optional)
if status is-interactive
    and not set -q TMUX
        tmux attach -t default || tmux new -s default
end
