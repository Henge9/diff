#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

function main() {
	git diff HEAD^ HEAD swagger.yaml | grep version:
}
function versionHunter() {
	echo "Hello"

}
main $@
exit $?
