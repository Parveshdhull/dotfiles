# Load user-specific aliases and functions
source ~/.bash/base
source ~/.bash/bash_aliases
source ~/.bash/bash_functions
source ~/.bash/bash_variables

# Set prompt to the hostname
set-prompt "$(hostname)"

# Load directory colors
[ ! -f ~/.dircolors ] && dircolors -p | sed 's/;42/;01/' > ~/.dircolors
eval $(dircolors ~/.dircolors)

# Enable useful shell options
shopt -s extglob autocd globstar
