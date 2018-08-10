#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

main() {
	git diff HEAD^ HEAD swagger.yaml | versionHunter $@
}
versionHunter() {
	echo "Hello"
	echo $1
}
main $@
exit $?
