# Load user-specific aliases and functions
source ~/.bash_aliases
source ~/.bash_functions
source ~/.bash_variables

# Set prompt to the hostname
set-prompt "$(hostname)"

# Load directory colors
dircolors -p | sed 's/;42/;01/' >~/.dircolors
eval $(dircolors ~/.dircolors)

# Enable useful shell options
shopt -s extglob autocd globstar

# If the hostname is nova, import .bash_nova
if [[ "$(hostname)" == "nova" ]]; then
	source ~/.bash_nova
fi
