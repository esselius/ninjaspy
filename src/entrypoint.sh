#!/usr/bin/env bash

set -eo pipefail

source lib.sh

main() {
	declare actions=(run test) modules=(asg) action="$1" module="$2"

	case "${action}" in
		help)
			usage
			;;
		test)
			for module in "${modules[@]}"; do
				eval "${module}_${action}"
			done
			;;
		""|*)
			if [[ $# == 0 ]]; then
				exec bash
			else
				exec "$@"
			fi
			;;
	esac
}

usage() {
	cat <<EOF

Usage: ${0} <action> [module]

Actions:
$(for action in "${actions[@]}"; do
echo "- ${action}"
done)

Modules:
$(for module in "${modules[@]}"; do
echo "- ${module}"
done)

EOF
}

main "$@"
