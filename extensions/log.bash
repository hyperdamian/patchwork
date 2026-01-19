#!/usr/bin/env bash

# $ log INFO 'Hello World!'
#   2026-01-01 09:00:00 [INFO] Hello World!
log() {
	echo "$(date +'%Y-%m-%d %H:%M:%S') [${1}] ${2}"
}
