#!/usr/bin/env bash

packages="
	build-essential
	curl
	gimp
	gitk
	glogg
	gnome-tweaks
	gparted
	hardinfo
	hstr
	htop
	httpie
	inotify-tools  `# contains inotifywait`
	libxml2-utils  `# contains xmllint`
	mc
	meld
	p7zip-full
	python3-pip
	sshfs
	tree
	"

sudo apt update && sudo apt install ${packages}
