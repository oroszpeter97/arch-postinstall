# BIOS
 - Disable secure boot
 - Clear keys, certificates

# Network
 - If wired connection probably nothing to do here
 - If Wi-Fi, then
	`iwctl`
	`device list`
	`station wlan# get-networks`
	`station wlan# connect <SSID>`
 - Check network connection

# Update keyring
`pacman -Sy archlinux-keyring`

# Partitioning
 - Linux filesystem
 - EFI <1G>
 - Linux swap <4G-16G>

`lsblk`
`cfdisk`

# Formatting partitions
`mkfs.ext4 <Linux filesystem>`
`mkfs.fat -F32 <EFI>`
`mkswap <Linux swap>`

# Mounting
`mount <Linux filesystem> /mnt`
`mkdir /mnt/boot`
`mount <EFI> /mnt/boot`
`swapon <Linux swap>`

# Install arch to disk
`pacstrap -i /mnt base base-devel linux linux-firmware sudo networkmanager <amd-ucode,intel-ucode>`

# Filesystem table
`genfstab -U /mnt >> /mnt/etc/fstab`

# chroot into arch on disk
`arch-chroot /mnt`

# Setup users
## Root password
`passwd`
## Normal user
`useradd -m -g users -G wheel,storage,power,video,audio -s /bin/bash <name-of-user>`
`passwd <name-of-user>`
Uncomment wheel group with password
`visudo`

#Update system
`sudo pacman -Syu`
`ln -sf /usr/share/zoneinfo/Europe/Budapest`
`hwclock --systohc`
Uncomment locale
`vim /etc/locale.gen`
`locale-gen`
Add "LANG=en_US.UTF-8"
`vim /etc/locale.conf`
Add hostname
`vim /etc/hostname`
Add
127.0.0.0	localhost
::1		localhost
127.0.1.1	hostname.localdomain	hostname	
`vim /etc/hosts`

# GRUB
`pacman -S grub efibootmgr dosfstools mtools`
`grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=GRUB`
`grub-mkconfig -o /boot/grub/grub.cfg`

# Networkmanager service
`systemctl enable NetworkManager`

# Reboot
`exit`
`umount -lR /mnt`
`reboot`
