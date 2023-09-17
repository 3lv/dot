arch_packages=( "w3m" "tree" )
if [[ -f /etc/arch-release ]]; then
	sudo pacman -Syu --noconfirm
	for package in "${arch_packages[@]}"; do
		sudo pacman -S --needed --noconfirm $package
	done
fi
