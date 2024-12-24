# General Aliases
alias make-complete="complete -W \"\`([[ -r Makefile ]] && grep -oE '^[a-zA-Z0-9_-]+:([^=]|$)' Makefile || cat /dev/null) | sed 's/[^a-zA-Z0-9_-]*$//'\`\" make"

# Navigation
alias z="cd /mnt/data/work/status-mobile && make-complete"
alias x="cd /mnt/data/work/status-go && make-complete"
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
alias bn='sudo nixos-rebuild switch --flake .#`hostname`'
alias bl='nixos-rebuild switch --flake .#luna --target-host monu@luna --build-host monu@luna --use-remote-sudo'
alias ba='nixos-rebuild switch --flake .#altair --target-host monu@altair --build-host monu@altair --use-remote-sudo'

# Security
alias sp='nix-shell --pure -p '

# Desktop
alias d="cd ~/Desktop"
alias ds="cd ~/Downloads"

# Restic
alias mega="restic -r rclone:mega:storagebox -o rclone.program='rclone --config /run/agenix/service/rclone/conf' --password-file /run/agenix/service/restic/pass-mega"
alias nova-local="restic --repo /mnt/storagebox-nova/nova --password-file /run/agenix/service/restic/pass"
alias nova-storagebox="restic --repo sftp:storagebox:/home/nova --password-file /run/agenix/service/restic/pass"
alias luna-local="restic --repo /mnt/storagebox-luna/luna --password-file /run/agenix/service/restic/pass"
alias luna-storagebox="restic --repo sftp:storagebox:/home/luna --password-file /run/agenix/service/restic/pass"

# Misc
alias format="shfmt -i 2 -w "
alias xo=xdg-open
alias compress-videos='for f in *.mp4; do ffmpeg -i "$f" -vcodec libx265 -crf 28 "compressed_$f"; done'
alias combine-images='magick *.jpg combined-images.pdf'
alias combine-pdfs='pdftk *.pdf cat output combined.pdf'
