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
