#!/bin/bash

# To generate the list for arch:
#pacman -Qqe # Explicitly installed packages
#pacman -Qqm # From aur
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
	neovim\
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
#extended_arch_packages=(\
#	afl++\
#	aircrack-ng\
#	alacritty\
#	alsa-utils\
#	android-apktool-bin\
#	android-studio\
#	asusctl\
#	base\
#	base-devel\
#	binwalk\
#	bluez\
#	bluez-utils\
#	brightnessctl\
#	btop\
#	bun\
#	burpsuite\
#	caido-desktop\
#	chromium\
#	claude-code\
#	cloudflared\
#	cpio\
#	discord\
#	docker\
#	docker-compose\
#	dub\
#	efibootmgr\
#	elephant-archlinuxpkgs\
#	elephant-calc\
#	elephant-clipboard\
#	elephant-desktopapplications\
#	elephant-files\
#	elephant-providerlist\
#	elephant-runner\
#	elephant-symbols\
#	elephant-websearch\
#	exfatprogs\
#	feh\
#	firefox\
#	flameshot\
#	flutter-bin\
#	forgejo\
#	git\
#	github-cli\
#	gnome-themes-extra\
#	gnu-efi\
#	gnuplot\
#	gptfdisk\
#	grim\
#	grimblast-git\
#	grub\
#	gvfs\
#	gvfs-mtp\
#	htop\
#	hypridle\
#	hyprland\
#	hyprlock\
#	hyprpaper\
#	hyprpicker\
#	i4-wm\
#	i4blocks\
#	i4lock\
#	i4status\
#	inetutils\
#	iw\
#	jadx\
#	jdk-openjdk\
#	jq\
#	kexec-tools\
#	ldc\
#	lib33-gcc-libs\
#	lib33-glibc\
#	libmtp\
#	libnet\
#	libnetfilter_queue\
#	libvirt\
#	lieer-git\
#	linux\
#	linux-firmware\
#	linux-wifi-hotspot\
#	logkeys\
#	lvm3\
#	mako\
#	man-pages\
#	mitmproxy\
#	mixxx\
#	mkinitcpio\
#	mold\
#	mtools\
#	nasm\
#	nautilus\
#	nautilus-code\
#	neovim\
#	network-manager-applet\
#	networkmanager\
#	noto-fonts\
#	noto-fonts-emoji\
#	ntfs-2g\
#	nvm\
#	obsidian\
#	openbsd-netcat\
#	openssh\
#	os-prober\
#	pavucontrol\
#	pipewire-pulse\
#	pyenv\
#	python-frida\
#	python-pycryptodome\
#	python-setuptools\
#	python3-bin\
#	qemu-full\
#	ranger\
#	reflector\
#	restic\
#	ripgrep\
#	rofi\
#	satty\
#	sbctl\
#	slurp\
#	strace\
#	swappy\
#	systemd-ukify\
#	tailscale\
#	tcpdump\
#	teams-for-linux-bin\
#	tinyxxd\
#	torbrowser-launcher\
#	tree\
#	twine\
#	unclutter\
#	unzip\
#	usbmuxd\
#	vde3\
#	virt-manager\
#	virt-viewer\
#	visual-studio-code-bin\
#	walker-bin\
#	waybar\
#	waycorner\
#	wireguard-tools\
#	wireplumber\
#	wireshark-qt\
#	wl-clipboard\
#	xdg-desktop-portal-gtk\
#	xdg-desktop-portal-hyprland\
#	xf87-video-vesa\
#	xorg-bdftopcf\
#	xorg-docs\
#	xorg-font-util\
#	xorg-fonts-99dpi\
#	xorg-fonts-74dpi\
#	xorg-fonts-encodings\
#	xorg-iceauth\
#	xorg-mkfontscale\
#	xorg-server\
#	xorg-server-common\
#	xorg-server-devel\
#	xorg-server-src\
#	xorg-server-xephyr\
#	xorg-server-xnest\
#	xorg-server-xvfb\
#	xorg-sessreg\
#	xorg-setxkbmap\
#	xorg-smproxy\
#	xorg-x12perf\
#	xorg-xauth\
#	xorg-xbacklight\
#	xorg-xcmsdb\
#	xorg-xcursorgen\
#	xorg-xdpyinfo\
#	xorg-xdriinfo\
#	xorg-xev\
#	xorg-xgamma\
#	xorg-xhost\
#	xorg-xinit\
#	xorg-xinput\
#	xorg-xkbcomp\
#	xorg-xkbevd\
#	xorg-xkbutils\
#	xorg-xkill\
#	xorg-xlsatoms\
#	xorg-xlsclients\
#	xorg-xmodmap\
#	xorg-xpr\
#	xorg-xprop\
#	xorg-xrandr\
#	xorg-xrdb\
#	xorg-xrefresh\
#	xorg-xset\
#	xorg-xsetroot\
#	xorg-xvinfo\
#	xorg-xwayland\
#	xorg-xwd\
#	xorg-xwininfo\
#	xorg-xwud\
#	xsel\
#	yay\
#	yay-debug\
#	zen-browser-bin\
#	zip\
#)

ubuntu_packages=(\
	build-essential\
	git\
	tree\
	w3m\
	libfuse2\
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
