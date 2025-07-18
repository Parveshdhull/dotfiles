contains() { [[ "$1" =~ (^|[[:space:]])"$2"($|[[:space:]]) ]]; }

set-prompt() {
  HOSTNAME="$1"

  case "$HOSTNAME" in
  altair) color="\[\033[0;32m\]" ;; # Green
  luna) color="\[\033[0;34m\]" ;;   # Blue
  astra) color="\[\033[0;33m\]" ;;  # Yellow
  nova) color="\[\033[0;31m\]" ;;   # Red
  *) color="\[\033[0;37m\]" ;;      # Default White
  esac

  PS1="[${color}\W\[\033[0;37m\]]-> " # Closing bracket is white
  export PS1
}

# Restic config
RESTIC_PASSFILE="/run/agenix/service/restic/pass"
RCLONE_CONFIG="/run/agenix/service/rclone/conf"

# Base runner for restic commands
restic_run() {
  repo="$1"
  shift
  password_file="$1"
  shift
  rclone_needed="$1"
  shift

  cmd=(restic --repo="$repo" --password-file="$password_file")

  if [[ "$rclone_needed" == "yes" ]]; then
    cmd+=(-o "rclone.program=rclone --config $RCLONE_CONFIG")
  fi

  "${cmd[@]}" "$@"
}

# Shortcuts
mega() { restic_run "rclone:mega:storagebox" "$RESTIC_PASSFILE-mega" yes "$@"; }
nova-blazebox() { restic_run "rclone:blazebox:blazebox/nova" "$RESTIC_PASSFILE" no "$@"; }
luna-blazebox() { restic_run "rclone:blazebox:blazebox/luna" "$RESTIC_PASSFILE" no "$@"; }
nova-storagebox-nova() { restic_run "rclone:storagebox-nova:/repositories/nova" "$RESTIC_PASSFILE" yes "$@"; }
nova-storagebox-luna() { restic_run "rclone:storagebox-nova:/repositories/luna" "$RESTIC_PASSFILE" yes "$@"; }
luna-storagebox-nova() { restic_run "rclone:storagebox-luna:/repositories/nova" "$RESTIC_PASSFILE" yes "$@"; }
luna-storagebox-luna() { restic_run "rclone:storagebox-luna:/repositories/luna" "$RESTIC_PASSFILE" yes "$@"; }

