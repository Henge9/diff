#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
BRANCH_NAME="develop"
main() {
	git show :/^Merge
	git show HEAD --name-only --oneline

	if [[ $(git show HEAD --name-only --oneline | grep -q api/swagger/swagger.yaml) || $? -eq 0 ]]; then
		echo "swagger.yaml is changed building dart api."
	else
		echo "No changes in swagger.yaml, dart api will not be built."
		exit 0
	fi

	echo "running!"
}
main $@
exit $?
