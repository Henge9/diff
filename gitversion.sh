#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

main() {
	git diff HEAD^ HEAD swagger.yaml
	if ! git diff --quiet HEAD^ HEAD swagger.yaml; then
		echo "it has changed"
		git diff HEAD^ HEAD swagger.yaml | grep version:
		if ! git diff --quiet HEAD^ HEAD swagger.yaml | grep version:; then
			echo "version to"
		else
			echo "goto ..."
		fi
	else
		echo "exit 0"
	fi

}
main $@
exit $?
