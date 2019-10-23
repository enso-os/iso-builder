DISTRO_NAME=Enso_OS

# Repositories to be present in installed system
DISTRO_REPOS=\
	$(UBUNTU_REPOS) \
	ppa:system76/pop \
	ppa:enso-os/stable

# Add proposed repositories
ifeq ($(PROPOSED),1)
DISTRO_REPOS+=\
	ppa:system76/proposed
endif

# Add binary repository without source
DISTRO_REPOS+=\
	-- \
	'deb http://apt.pop-os.org/proprietary $(UBUNTU_CODE) main'

# Packages to install
DISTRO_PKGS=\
	linux-generic-hwe-18.04 \
	linux-signed-generic-hwe-18.04 \
	ubuntu-minimal \
	ubuntu-standard \
	appstream \
	gala \
	datetime-applet \
	apphive \
	plank \
	enso-greeter \
	desktop-settings \
	enso-launchy \
	enso-welcome 

ifeq ($(NVIDIA),1)
DISTRO_PKGS+=\
	nvidia-driver-418
endif

# Packages to have in live instance
LIVE_PKGS=\
	casper \
	distinst \
	expect \
	gparted 

# Packages to remove from installed system (usually installed as Recommends)
RM_PKGS=\
	imagemagick-6.q16 \
	pop-installer-session \
	tracker \
	unattended-upgrades \
	xul-ext-ubufox

# Packages not installed, but that may need to be discovered by the installer
MAIN_POOL=\
	at \
	ethtool \
	grub-efi-amd64 \
	grub-efi-amd64-bin \
	grub-efi-amd64-signed \
	kernelstub \
	libx86-1 \
	pm-utils \
	powermgmt-base \
	python3-evdev \
	python3-systemd \
	system76-driver \
	system76-firmware-daemon \
	system76-wallpapers \
	vbetool \
	xbacklight

ifeq ($(NVIDIA),1)
MAIN_POOL+=\
	system76-driver-nvidia
endif

# Additional pool packages from the restricted set of packages
RESTRICTED_POOL=\
	amd64-microcode \
	intel-microcode \
	iucode-tool
