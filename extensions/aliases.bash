#!/usr/bin/env bash

# Move up in directory tree
#
# $ cd /usr/local/bin/; pwd
#   /usr/local/bin
# $ ...; pwd
#   /usr
alias up='cd ../'
alias ..='cd ../'
alias ...='cd ../../'
alias ....='cd ../../../'

# Reenter current directory
#
# $ cd /tmp; pwd
#   /tmp
# $ reenter; pwd
#   /tmp
alias reenter='cd $(pwd)'

# Print multiline $PATH splitted by colon
#
# $ path
#   /usr/bin
#   /sbin
#   /bin
# 	...
alias path='echo -e ${PATH//:/\\n}'

# Search in history
alias hgrep='history | grep'

# Search in processes
alias psgrep='pgrep -fa'

# Reload aliases
alias reload='source ~/.bash_aliases'

# Aliases for package manager
alias upgrade='sudo apt update && sudo apt upgrade'
alias cleanup='sudo apt autoclean && sudo apt autoremove'

# Exiting the shorter way
alias q='exit'

# Clean project (AKA fresh start:)
alias wipe='find \( -name "target" -or -name "*.iml" -or -name ".idea" \) -prune -exec rm -rf {} \;'

# Basic rsync flags; protip: use dry run first ('-n' flag)
alias backup='rsync -amv --delete'

# Make directory (with parents) and enter it
#
# $ cd /tmp; pwd
#   /tmp
# $ mkcd ./foo/bar/baz; pwd
#   /tmp/foo/bar/baz
function mkcd() {
	mkdir --parents "$1" && cd "$_"
}

# Find file in given path or directly in any of its parents
#
# $ upfinder /usr/local/bin etc
#   /usr/local/etc
# $ upfinder /usr/local/bin tmp
#   /tmp
# $ upfinder /usr/local/bin systemd
#   Could not find: systemd
function upfinder() {
	local workdir=$(realpath --no-symlinks $1)
	local wanted=$2
	local reference=$(realpath --no-symlinks "$workdir/$wanted")

	if [[ -e ${reference} ]]; then # found
		echo ${reference}
	elif [[ ${workdir} == '/' ]]; then # not found
		echo "Could not find: $wanted" >&2
		return 42
	else # try in parent directory
		upfinder "$workdir/.." ${wanted}
	fi
}
