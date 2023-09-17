#!/bin/bash
arch_packages=(\
	base\
	base-devel\
	bear\
	git\
	linux\
	linux-firmware\
	sudo\
	tree\
	w3m\
)
extended_arch_packages=(\
	alacritty\
	discord\
	feh\
	firefox\
	gdb\
	i3-wm\
	mingw-w64-gcc\
	mpv\
	nasm\
	neofetch\
	neomutt\
	noto-fonts\
	npm\
	os-prober\
	rofi\
	unclutter\
	unzip\
	xorg\
	xsel\
	zip\
)
ubuntu_packages=(\
	build-essential\
	git\
	tree\
	w3m\
)

DISTRO=$(lsb_release -is)
if [[ DISTRO == "" ]]; then
	echo "Distribution was not detected"
	exit 1
fi
	
if [[ $DISTRO == Arch ]]; then
	echo "Arch Linux installation"
	packages=${arch_packages[@]}
	read -r -p "Do an extended installation? [y/N] "
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		packages=( "${packages[@]}" "${extended_arch_packages[@]}" )
	fi
	sudo pacman -Syu --noconfirm
	sudo pacman -S --needed --noconfirm ${packages[@]}
	# for package in ${packages[@]}; do
	# done
elif [[ $DISTRO == Debian || $DISTRO == Ubuntu ]]; then
	echo "$DISTRO installation"
	packages=${ubuntu_packages[@]}
	sudo apt update
	sudo apt upgrade
	sudo apt -y install ${packages[@]}
else
	echo "Distribution $DISTRO not supported"
fi
