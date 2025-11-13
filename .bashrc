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

# Print laptop battery percentage
[[ $(hostname) == luna ]] && [[ -f /sys/class/power_supply/BAT1/capacity ]] && echo "Luna Battery: $(cat /sys/class/power_supply/BAT1/capacity)%"
