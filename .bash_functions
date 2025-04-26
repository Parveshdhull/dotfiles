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
  repo="$1"; shift
  password_file="$1"; shift
  rclone_needed="$1"; shift

  cmd=(restic --repo="$repo" --password-file="$password_file")

  if [[ "$rclone_needed" == "yes" ]]; then
    cmd+=(-o "rclone.program=rclone --config $RCLONE_CONFIG")
  fi

  "${cmd[@]}" "$@"
}

# Shortcuts
mega()                   { restic_run "rclone:mega:storagebox" "$RESTIC_PASSFILE-mega" yes "$@"; }
nova-storagebox()        { restic_run "sftp:storagebox:/home/repositories/nova" "$RESTIC_PASSFILE" no "$@"; }
luna-storagebox()        { restic_run "sftp:storagebox:/home/repositories/luna" "$RESTIC_PASSFILE" no "$@"; }
nova-storagebox-nova()   { restic_run "rclone:storagebox-nova:/repositories/nova" "$RESTIC_PASSFILE" yes "$@"; }
nova-storagebox-luna()   { restic_run "rclone:storagebox-nova:/repositories/luna" "$RESTIC_PASSFILE" yes "$@"; }
luna-storagebox-nova()   { restic_run "rclone:storagebox-luna:/repositories/nova" "$RESTIC_PASSFILE" yes "$@"; }
luna-storagebox-luna()   { restic_run "rclone:storagebox-luna:/repositories/luna" "$RESTIC_PASSFILE" yes "$@"; }

# Function to report snapshots
restic-report() {
  repos=(
    mega
    nova-storagebox
    luna-storagebox
    nova-storagebox-nova
    nova-storagebox-luna
    luna-storagebox-nova
    luna-storagebox-luna
  )

  echo "📦 Snapshot Report for All Repositories"
  echo "---------------------------------------"

  for repo in "${repos[@]}"; do
    echo ""
    echo "🔹 $repo"

    snapshots=$($repo snapshots)

    if [[ $? -eq 0 ]]; then
      echo "$snapshots" | tail -n 6
    else
      echo "❌ Failed to list snapshots for $repo"
    fi
  done
}
