#!/usr/bin/env bash

apt_packages="
	build-essential
	curl
	docker.io docker-compose-v2
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

snap_packages="
	bruno
	difftastic
	"

sudo apt update && sudo apt install ${apt_packages}

snap install ${snap_packages}

curl -f https://zed.dev/install.sh | sh
