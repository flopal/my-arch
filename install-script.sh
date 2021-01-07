# Temps
ln -sf /usr/share/zoneinfo/Europe/Paris /etc/localtime
hwclock --systohc

# Editeurs
pacman -S vim nano gvim

# Langage
nano /etc/locale.gen
locale-gen
vim /etc/locale.conf # LANG=fr_FR.UTF-8
vim /etc/vconsole.conf # KEYMAP=fr-latin1
vim /etc/hostname
vim /etc/hosts 

# Paquets réseaux
pacman -S iproute2 dhclient networkmanager nm-connection-editor
systemctl enable NetworkManager.service

# Mot de passe 
passwd

# Génération de l'init
mkinitcpio -P

# Génaration du grub
pacman -S grub intel-ucode
grub-install /dev/sda
grub-mkconfig -o /boot/grub/grub.cfg

# Ajout d'un utilisateur
useradd -m -s /bin/bash florent
passwd florent

# Ajout des outils de synchronisation
pacman -S rsync syncthing grsync syncthing-gtk

# Outils de packaging 
pacman -S pacutils lostfiles gnome-packagekit gnome-software
paccheck --md5sum --quiet

# Script pour activer le pavé numérique lors du login (voir https://wiki.archlinux.org/index.php/Activating_numlock_on_bootup)
vim /usr/local/bin/numlock
chmod +x /usr/local/bin/numlock
vim /etc/systemd/system/numlock.service

# Installation de gnome
pacman -S gnome gnome-extra
systemctl enable gdm

# Installations des thèmes gtk
pacman -S adapta-gtk-theme arc-gtk-theme breeze-gtk deepin-gtk-theme gnome-themes-extra materia-gtk-theme mate-themes gnome-tweaks kde-gtk-config

# Outils de sécurité
pacman -S ldns bind iptables

# Installations des fonts
pacman -S ttf-font ttf-bitstream-vera ttf-croscore ttf-dejavu ttf-droid ttf-ibm-plex ttf-liberation ttf-linux-libertine noto-fonts gnu-free-fonts cantarell-fonts inter-font ttf-opensans adobe-source-sans-pro-fonts gentium-plus-font ttf-junicode xorg-fonts-type1 noto-fonts-emoji ttf-joypixels
