# Load user-specific aliases and functions
source ~/.bash_aliases
source ~/.bash_functions
source ~/.bash_variables

# Set prompt to the hostname
set-prompt "$(hostname)"

# Load directory colors
[ ! -f ~/.dircolors ] && dircolors -p | sed 's/;42/;01/' > ~/.dircolors
eval $(dircolors ~/.dircolors)

# Enable useful shell options
shopt -s extglob autocd globstar
