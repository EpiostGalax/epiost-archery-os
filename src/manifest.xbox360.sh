#! /bin/bash

#! 27 my anniv!
export VERSION="27"
export SYSTEM_DESC="EpiostGalax"
export SYSTEM_NAME="epiost-archery-os"
export USERNAME="gamer"
export SIZE="10000MB"
export ARCHIVE_DATE=""
export WEBSITE="https://epiost.org"
export DOCUMENTATION_URL="https://epiost.org/about"
export BUG_REPORT_URL="https://github.com/EpiostGalax/epiost-archery-os/issues"

export PACKAGES="\
	amd-ucode \
	intel-ucode \
	htop \
	lightdm \
	accountsservice \
	xorg-server \
	bluez \
	bluez-utils \
	bluez-plugins \
	bluez-hid2hci \
	lib32-freetype2 \
	lib32-curl \
	lib32-libgpg-error \
	networkmanager \
	pipewire \
	lib32-pipewire \
	xdg-desktop-portal \
	xdg-desktop-portal-wlr \
	pulseaudio \
	lib32-libpulse \
	pulseaudio-alsa \
	alsa-utils \
	alsa-firmware \
	sof-firmware \
	alsa-ucm-conf \
	pulseaudio-bluetooth \
	sudo \
	python \
	flatpak \
	vulkan-icd-loader \
	lib32-vulkan-icd-loader \
	libva-mesa-driver \
	lib32-libva-mesa-driver \
	mesa-vdpau \
	mesa-demos \
	lib32-mesa-vdpau \
	libva-vdpau-driver \
	lib32-libva-vdpau-driver \
	vulkan-radeon \
	lib32-vulkan-radeon \
	xf86-video-amdgpu \
	vulkan-intel \
	lib32-vulkan-intel \
	libva-intel-driver \
	lib32-libva-intel-driver \
	xf86-video-intel \
	intel-media-driver \
	nvidia \
	opencl-nvidia \
	lib32-opencl-nvidia \
	nvidia-utils \
	lib32-nvidia-utils \
	nvidia-prime \
	ttf-liberation \
	wqy-zenhei \
	openssh \
	diffutils \
	logrotate \
	vim \
	unzip \
	which \
	linux-firmware \
	linux-headers \
	retroarch \
	libretro-beetle-psx \
	libretro-beetle-psx-hw \
	libretro-blastem \
	libretro-bsnes \
	libretro-bsnes-hd \
	libretro-citra \
	libretro-dolphin \
	libretro-desmume \
	libretro-gambatte \
	libretro-genesis-plus-gx \
	libretro-melonds \
	libretro-mgba \
	libretro-mupen64plus-next \
	libretro-nestopia \
	libretro-parallel-n64 \
	libretro-scummvm \
	libretro-snes9x \
	libretro-yabause \
	libretro-flycast \
	libretro-play \
	libretro-kronos \
	libretro-beetle-pce-fast \
	libretro-picodrive \
	libretro-ppsspp \
	libretro-pcsx2 \
	libretro-shaders-slang \
	nss-mdns \
	haveged \
	openbox \
	pulsemixer \
	usbutils \
	ethtool \
	nano \
	boost-libs \
	gamemode \
	lib32-gamemode \
	podman \
	podman-compose \
	lshw \
	rsync \
	dosbox \
	broadcom-wl \
	ipw2100-fw \
	ipw2200-fw \
	intel-undervolt \
	cifs-utils \
	nfs-utils \
	smbclient \
	mame-tools \
	usb_modeswitch \
	sxhkd \
	fmt \
	udisks2 \
	udiskie \
	openal \
	lib32-openal \
	wavpack \
	libcurl-gnutls \
	libidn11 \
	liquidctl \
	chaotic-aur/dolphin-emu-git \
	chaotic-aur/dolphin-emu-nogui-git \
	chaotic-aur/python-vdf \
	chaotic-aur/yuzu-mainline-git \
	chaotic-aur/rpcs3-git \
	chaotic-aur/libretro-mame-git \
	chaotic-aur/libretro-stella2014-git \
	chaotic-aur/legendary \
	chaotic-aur/boxtron \
	chaotic-aur/rtl88x2bu-dkms-git \
	chaotic-aur/rtw89-dkms-git \
"

export AUR_PACKAGES="\
	frzr \
	steamos-compositor-plus \
	chimera \
	python-inotify-simple \
	retroarch-autoconfig-udev-git \
	alienware-alpha-wmi \
	bcache-tools \
	libretro-virtualjaguar-git \
	libretro-opera-git \
	wyvern \
	gamescope-git \
	gamescope-session-git \
	srt-live-server \
	r8152-dkms \
	rtl8812au-dkms-git \
	rtl8814au-dkms-git \
	xone-dkms \
	xpad-noone-dkms \
	xpadneo-dkms \
	bcm20702a1-firmware \
	python-evdev \
	aya-neo-fixes-git \
	nintendo-udev \
	steam-removable-media-git \
"

export SERVICES="\
	frzr-autoupdate.timer \
	NetworkManager \
	lightdm \
	bluetooth \
	fstrim.timer \
	avahi-daemon \
	chimera-proxy.service \
	chimera-proxy.socket \
	haveged \
	systemd-timesyncd \
	sshd \
	neo-controller \
"

export USER_SERVICES="\
	chimera.service \
	steam-patch.service \
	gamemoded.service \
	sxhkd.service \
"

export FILES_TO_DELETE="\
	/boot/initramfs-linux-fallback.img \
	/boot/syslinux \
	/usr/include \
	/usr/share/gtk-doc \
	/usr/share/man \
	/usr/share/doc \
	/usr/share/ibus \
	/usr/share/help \
	/usr/share/jack-audio-connection-kit \
	/usr/share/SFML \
	/usr/share/libretro/autoconfig/udev/Xbox_360_Wireless_Receiver_Chinese01.cfg \
	/usr/share/libretro/autoconfig/udev/Gasia_PS_Gamepad_USB.cfg \
	/usr/share/libretro/autoconfig/udev/Sony-PlayStation3-DualShock3-Controller-Bluetooth.cfg \
	/usr/src \
"

postinstallhook() {
	# disable retroarch menu in joypad configs
	find /usr/share/libretro/autoconfig -type f -name '*.cfg' | xargs -d '\n' sed -i '/input_menu_toggle_btn/d'

	# download and add racing wheel udev rules
	pushd /usr/lib/udev/rules.d
	curl -L -O https://raw.githubusercontent.com/berarma/oversteer/master/data/udev/99-fanatec-wheel-perms.rules
	curl -L -O https://raw.githubusercontent.com/berarma/oversteer/master/data/udev/99-logitech-wheel-perms.rules
	curl -L -O https://raw.githubusercontent.com/berarma/oversteer/master/data/udev/99-thrustmaster-wheel-perms.rules
	popd

	# avoid some broken libretro cores
	curl -L -O https://archive.archlinux.org/repos/2022/01/09/community/os/x86_64/libretro-flycast-4475-1-x86_64.pkg.tar.zst
	curl -L -O https://archive.archlinux.org/repos/2022/01/18/community/os/x86_64/libretro-ppsspp-31516-1-x86_64.pkg.tar.zst

	# downgrade nvidia drivers (latest version causing many retroarch cores to segfault)
	curl -L -O https://archive.archlinux.org/repos/2022/04/01/multilib/os/x86_64/lib32-nvidia-utils-510.54-1-x86_64.pkg.tar.zst
	curl -L -O https://archive.archlinux.org/repos/2022/04/01/multilib/os/x86_64/lib32-opencl-nvidia-510.54-1-x86_64.pkg.tar.zst
	curl -L -O https://archive.archlinux.org/repos/2022/04/01/extra/os/x86_64/nvidia-510.54-11-x86_64.pkg.tar.zst
	curl -L -O https://archive.archlinux.org/repos/2022/04/01/extra/os/x86_64/nvidia-prime-1.0-4-any.pkg.tar.zst
	curl -L -O https://archive.archlinux.org/repos/2022/04/01/extra/os/x86_64/nvidia-utils-510.54-1-x86_64.pkg.tar.zst
	curl -L -O https://archive.archlinux.org/repos/2022/04/01/extra/os/x86_64/opencl-nvidia-510.54-1-x86_64.pkg.tar.zst

	# get mangohud packages from Valve (current AUR package doesn't build mangoapp)
	curl -L -O https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/lib32-mangohud-0.6.6.1.r222.gae85730-1-x86_64.pkg.tar.zst
	curl -L -O https://steamdeck-packages.steamos.cloud/archlinux-mirror/jupiter-main/os/x86_64/mangohud-0.6.6.1.r222.gae85730-1-x86_64.pkg.tar.zst

	pacman --noconfirm -U *.pkg.tar.zst
	rm *.pkg.tar.zst
}
