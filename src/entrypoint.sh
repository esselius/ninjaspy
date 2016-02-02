#!/usr/bin/env bash

set -eo pipefail

source lib.sh

main() {
	declare modules=(asg) action="$1" module="$2"

	case "${action}" in
		test)
			case "${module}" in
				""|*)
					for module in "${modules[@]}"; do
						eval "${module}_${action}"
					done
					;;
			esac
			;;
	esac
}

main "$@"
