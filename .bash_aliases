# General Aliases
alias make-complete="complete -W \"\`([[ -r Makefile ]] && grep -oE '^[a-zA-Z0-9_-]+:([^=]|$)' Makefile || cat /dev/null) | sed 's/[^a-zA-Z0-9_-]*$//'\`\" make"

# Navigation
alias z="cd /mnt/data/work/orglist"
alias nb='cd /mnt/data/nebula'
alias df='cd /mnt/data/nebula/dotfiles'
alias nc='cd /mnt/data/nebula/nixos-config'
alias ncs='cd /mnt/data/nebula/nixos-config-secrets'
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."
alias tt='mkdir -p tt && cd tt'
alias c="cd -"

# Clear and Display
alias k="clear"
alias p="pwd"
alias t='trash'

# Listing
alias ls='ls --color=auto'
alias l='ls --color=auto'
alias ll='ls -lah --color=auto'
alias l.='ls -d .* --color=auto'
alias j='tree .'
alias ja='tree -a .'

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
alias altair='ssh altair'
alias astra='ssh astra'
alias luna='ssh luna'
alias lyra='ssh lyra'

# Git Aliases
alias ga="git add -A"
alias gb='git branch -v'
alias gc='git checkout'
alias gcc='git commit -m'
alias gd="git diff"
alias gf="git fetch"
alias gl="git log"
alias gll="git log -p"
alias gr="git restore"
alias grb="git rebase"
alias gs="git status"
alias git-last='git diff-tree --no-commit-id --name-only -r HEAD~0'
alias git-files='git diff-tree --no-commit-id --name-only -r'

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
alias pp='portfolio'
alias scan='scanimage -po "$(date +%s).png"'

# Nix
alias ns='nix-shell'
alias nf='nix flake update'
alias bn='nixos-rebuild switch --flake .#nova --target-host orion@localhost --sudo --ask-sudo-password'
alias bl='nixos-rebuild switch --flake .#luna --target-host monu@luna --build-host monu@luna --sudo --ask-sudo-password'
alias ba='nixos-rebuild switch --flake .#altair --target-host monu@altair --build-host monu@altair --sudo --ask-sudo-password'

# Security
alias sp='nix-shell --pure -p '

# Desktop
alias d="cd ~/Desktop"
alias ds="cd ~/Downloads"

# Sound
alias load-combine-sink='pactl load-module module-combine-sink'
alias unload-combine-sink='pactl unload-module module-combine-sink'

# Debug
alias ss='systemctl status '
alias sl='systemctl list-units --type=service'
alias st='systemctl list-units --type=timer'
alias pu='ps -eo pid,comm,user,args -w'
alias jr='journalctl -ru '
alias jf='journalctl -fu '

# Orion
alias or='ssh -t orion@localhost "export HOME=/home/monu; . ~/.bashrc; cd $(pwd); bash -i"'

# Misc
alias format="shfmt -i 2 -w "
alias xo=xdg-open
alias tk='tmux kill-session -t orglist'
alias compress-videos='for f in *.mp4; do ffmpeg -i "$f" -vcodec libx265 -crf 28 "compressed_$f"; done'
alias combine-images='magick *.jpg combined-images.pdf'
alias combine-pdfs='pdftk *.pdf cat output combined.pdf'
alias compress-pdf='gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
-dNOPAUSE -dQUIET -dBATCH -sOutputFile=compressed.pdf' # pdf_file
alias luna-battery='[[ $(hostname) == luna ]] && [[ -f /sys/class/power_supply/BAT1/capacity ]] && echo "Luna Battery: $(cat /sys/class/power_supply/BAT1/capacity)%"'
