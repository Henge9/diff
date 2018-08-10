#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
BRANCH_NAME="develop"
main() {
	git diff origin/"${BRANCH_NAME}" HEAD api/swagger/swagger.yaml

	if ! git diff --quiet origin/"${BRANCH_NAME}" HEAD api/swagger/swagger.yaml; then
		echo "swagger.yaml is changed building dart api."
	else
		echo "No changes in swagger.yaml, dart api will not be built."
		exit 0
	fi
}
main $@
exit $?
