#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

main() {
	git diff origin/develop -- HEAD swagger.yaml
	if ! git diff --quiet HEAD^ HEAD swagger.yaml; then
		echo "it has changed"
	else
		echo "exit 0"
	fi

	if ! git diff --quiet origin/"${BRANCH_NAME}" HEAD api/swagger/swagger.yaml; then
		echo "swagger.yaml is changed building dart api."
	else
		echo "No changes in swagger.yaml, dart api will not be built."
		exit 0
	fi
}
main $@
exit $?
