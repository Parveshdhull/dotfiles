# General Aliases
alias make-complete="complete -W \"\`([[ -r Makefile ]] && grep -oE '^[a-zA-Z0-9_-]+:([^=]|$)' Makefile || cat /dev/null) | sed 's/[^a-zA-Z0-9_-]*$//'\`\" make"

# Navigation
alias z="cd /mnt/data/work/status-mobile && make-complete"
alias x="cd /mnt/data/work/status-go && make-complete"
alias df='cd /mnt/data/nebula/dotfiles'
alias nc='cd /mnt/data/nebula/nixos-config'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias tt='mkdir -p tt && cd tt'
alias c="cd -"

# Clear and Display
alias f="fuck"
alias k="clear"
alias p="pwd"
alias t='trash'

# Listing
alias ls='ls --color=auto'
alias l='ls --color=auto'
alias ll='ls -lah --color=auto'
alias l.='ls -d .* --color=auto'
alias j='tree .'

# Messaging and Editor
alias msg='zenity --info --text'
alias vi=vim
alias at="(echo 'export DISPLAY=:0.0'; cat) | at"
alias emc="emacsclient -n -c"

# Searching and File Management
alias grep='grep --color=auto'
alias g='grep --color=auto'
alias biggest="du -h --max-depth=1 | sort -h"
alias :q="exit"

# SSH Commands
alias luna='ssh luna'
alias altair='ssh altair'
alias astra='ssh astra'

# Git Aliases
alias ga="git add -A"
alias gb='git branch -v'
alias gc='git checkout'
alias gcc='git commit -m'
alias gd="git diff"
alias gf="git fetch"
alias gfs="git fetch status"
alias gl="git log"
alias gll="git log -p"
alias gr="git restore"
alias grb="git rebase"
alias grbd="git rebase status/develop"
alias gs="git status"
alias git-last='git diff-tree --no-commit-id --name-only -r HEAD~0'
alias git-files='git diff-tree --no-commit-id --name-only -r'

# Tmux
alias td='tmux detach'
alias tk='tmux kill-session -t status'

# Make Commands
alias ml='make lint'
alias mlf='make lint-fix'
alias mc='make clean'
alias mt='make test'
alias mrc='make run-clojure'
alias mrm='make run-metro'
alias mra='make run-android'
alias mrr='make run-re-frisk && make android-ports'
alias maa='make android-ports'

# Software Launchers
alias pp='firejail portfolio'
alias scan='scanimage -po "$(date +%s).png"'

# Nix
alias ns='nix-shell'
alias bn='sudo nixos-rebuild switch --flake .#nova'
alias bl='sudo nixos-rebuild switch --flake .#luna --target-host monu@luna'
alias ba='sudo nixos-rebuild switch --flake .#altair --target-host monu@altair'

# Security
alias fj='firejail --noprofile bash'
alias sp='nix-shell --pure -p '

# Desktop
alias d="cd ~/Desktop"
alias ds="cd ~/Downloads"
alias lb="cd /home/monu/Desktop/ArchFiles/ExtrasLinux/MyScripts/Linux/bin"
alias pb="cd /home/monu/Desktop/ArchFiles/ExtrasLinux/MyScripts/Python/Mine/bin"
alias tf="cd '/home/monu/Desktop/ArchFiles/Extras/Text Files'"

# Misc
alias format="shfmt -i 2 -w "
alias xo=xdg-open
