#!/usr/bin/env bash
# Searches for the Maven Wrapper executable script in the directory hierarchy

set -euo pipefail

find_in_directory_hierarchy() {
	local executable=$1
	local workdir
	workdir=$(pwd)
    while [[ "$workdir" != '/' ]]; do
    	local path="$workdir/$executable"
    	if [[ -x "$path" ]]; then
    		echo -n "$path"
    		return
    	fi
    	workdir="$(dirname "$workdir")"
    done

    echo "Error: $executable was not found in the directory hierarchy" >&2
    return 1
}

main() {
	local mvnw
	mvnw=$(find_in_directory_hierarchy 'mvnw')
	MVNW_VERBOSE=true "$mvnw" "$@"
}

main "$@"
