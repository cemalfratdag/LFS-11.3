./configure --prefix=/usr --disable-static
make
make docdir=/usr/share/doc/check-0.15.2 install
cd ..
rm -Rf check-0.15.2
tar -xvf diffutils-3.9.tar.xz 
cd diffutils-3.9
./configure --prefix=/usr
make
make install
cd ..
rm -Rf diffutils-3.9
tar -xvf gawk-5.2.1.tar.xz 
cd gawk-5.2.1
sed -i 's/extras//' Makefile.in
./configure --prefix=/usr
make
make LN='ln -f' install
mkdir -pv                                   /usr/share/doc/gawk-5.2.1
cp    -v doc/{awkforai.txt,*.{eps,pdf,jpg}} /usr/share/doc/gawk-5.2.1
cd ..
rm -Rf gawk-5.2.1
tar -xvf findutils-4.9.0.tar.xz 
cd findutils-4.9.0
case $(uname -m) in     i?86)   TIME_T_32_BIT_OK=yes ./configure --prefix=/usr --localstatedir=/var/lib/locate ;;     x86_64) ./configure --prefix=/usr --localstatedir=/var/lib/locate ;; esac
make
make install
cd ..
rm -Rf findutils-4.9.0
tar -xvf groff-1.22.4.tar.gz 
cd groff-1.22.4
PAGE=<paper_size> ./configure --prefix=/usr
PAGE=A4 ./configure --prefix=/usr
make
make install
cd ..
rm -Rf groff-1.22.4
tar -xvf grub-2.06.tar.xz 
cd grub-2.06
patch -Np1 -i ../grub-2.06-upstream_fixes-1.patch
./configure --prefix=/usr                      --sysconfdir=/etc                  --disable-efiemu                   --disable-werror
make
make install
mv -v /etc/bash_completion.d/grub /usr/share/bash-completion/completions
cd ..
rm -Rf grub-2.06
tar -xvf gzip-1.12.tar.xz 
cd gzip-1.12
./configure --prefix=/usr
make
make install
cd ..
rm -Rf gzip-1.12
tar -xvf iproute2-6.1.0.tar.xz 
cd iproute2-6.1.0
sed -i /ARPD/d Makefile
rm -fv man/man8/arpd.8
make NETNS_RUN_DIR=/run/netns
make SBINDIR=/usr/sbin install
mkdir -pv             /usr/share/doc/iproute2-6.1.0
cp -v COPYING README* /usr/share/doc/iproute2-6.1.0
cd ..
rm -Rf iproute2-6.1.0
tar -xvf kbd-2.5.1.tar.xz 
cd kbd-2.5.1
patch -Np1 -i ../kbd-2.5.1-backspace-1.patch
sed -i '/RESIZECONS_PROGS=/s/yes/no/' configure
sed -i 's/resizecons.8 //' docs/man/man8/Makefile.in
./configure --prefix=/usr --disable-vlock
make
make install
mkdir -pv           /usr/share/doc/kbd-2.5.1
cp -R -v docs/doc/* /usr/share/doc/kbd-2.5.1
cd ..
rm -Rf kbd-2.5.1
tar -xvf libpipeline-1.5.7.tar.gz 
cd libpipeline-1.5.7
./configure --prefix=/usr
make
make install
cd ..
rm -Rf libpipeline-1.5.7
tar -xvf make-4.4.tar.gz 
cd make-4.4
sed -e '/ifdef SIGPIPE/,+2 d'     -e '/undef  FATAL_SIG/i FATAL_SIG (SIGPIPE);'     -i src/main.c
./configure --prefix=/usr
make
make install
cd ..
rm -Rf make-4.4
tar -xvf patch-2.7.6.tar.xz 
cd patch-2.7.6
./configure --prefix=/usr
make
make install
cd ..
rm -Rf patch-2.7.6
tar -xvf tar-1.34.tar.xz 
cd tar-1.34
FORCE_UNSAFE_CONFIGURE=1  ./configure --prefix=/usr
make
make install
make -C doc install-html docdir=/usr/share/doc/tar-1.34
cd ..
rm -Rf tar-1.34
tar -xvf texinfo-7.0.2.tar.xz 
cd texinfo-7.0.2
./configure --prefix=/usr
make
make install
make TEXMF=/usr/share/texmf install-tex
pushd /usr/share/info
  rm -v dir
  for f in *;     do install-info $f dir 2>/dev/null;   done
popd
cd ..
rm -Rf texinfo-7.0.2
tar -xvf vim-9.0.1273.tar.xz 
cd vim-9.0.1273
echo '#define SYS_VIMRC_FILE "/etc/vimrc"' >> src/feature.h
./configure --prefix=/usr
make
make install
ln -sv vim /usr/bin/vi
for L in  /usr/share/man/{,*/}man1/vim.1; do     ln -sv vim.1 $(dirname $L)/vi.1; done
ln -sv ../vim/vim90/doc /usr/share/doc/vim-9.0.1273
cat > /etc/vimrc << "EOF"
" Begin /etc/vimrc

" Ensure defaults are set before customizing settings, not after
source $VIMRUNTIME/defaults.vim
let skip_defaults_vim=1

set nocompatible
set backspace=2
set mouse=
syntax on
if (&term == "xterm") || (&term == "putty")
  set background=dark
endif

" End /etc/vimrc
EOF

cd ..
rm -Rf vim-9.0.1273
tar -xvf eudev-3.2.11.tar.gz 
cd eudev-3.2.11
sed -i '/udevdir/a udev_dir=${udevdir}' src/udev/udev.pc.in
./configure --prefix=/usr                       --bindir=/usr/sbin                  --sysconfdir=/etc                   --enable-manpages                   --disable-static
make
make install
tar -xvf ../udev-lfs-20171102.tar.xz
make -f udev-lfs-20171102/Makefile.lfs install
udevadm hwdb --update
cd ..
rm -Rf eudev-3.2.11
tar -xvf man-db-2.11.2.tar.xz 
cd man-db-2.11.2
./configure --prefix=/usr                                     --docdir=/usr/share/doc/man-db-2.11.2             --sysconfdir=/etc                                 --disable-setuid                                  --enable-cache-owner=bin                          --with-browser=/usr/bin/lynx                      --with-vgrind=/usr/bin/vgrind                     --with-grap=/usr/bin/grap                         --with-systemdtmpfilesdir=                        --with-systemdsystemunitdir=
make
make install
cd ..
rm -Rf man-db-2.11.2
tar -xvf procps-ng-4.0.2.tar.xz 
cd procps-ng-4.0.2
./configure --prefix=/usr                                       --docdir=/usr/share/doc/procps-ng-4.0.2             --disable-static                                    --disable-kill
make
make install
cd ..
rm -Rf procps-ng-4.0.2
tar -xvf util-linux-2.38.1.tar.xz 
cd util-linux-2.38.1
./configure ADJTIME_PATH=/var/lib/hwclock/adjtime             --bindir=/usr/bin                --libdir=/usr/lib                --sbindir=/usr/sbin              --disable-chfn-chsh              --disable-login                  --disable-nologin                --disable-su                     --disable-setpriv                --disable-runuser                --disable-pylibmount             --disable-static                 --without-python                 --without-systemd                --without-systemdsystemunitdir             --docdir=/usr/share/doc/util-linux-2.38.1
make
make install
cd ..
rm -Rf util-linux-2.38.1
tar -xvf e2fsprogs-1.47.0.tar.gz 
cd e2fsprogs-1.47.0
mkdir -v build
cd       build
../configure --prefix=/usr                        --sysconfdir=/etc                    --enable-elf-shlibs                  --disable-libblkid                   --disable-libuuid                    --disable-uuidd                      --disable-fsck
make
make install
rm -fv /usr/lib/{libcom_err,libe2p,libext2fs,libss}.a
gunzip -v /usr/share/info/libext2fs.info.gz
install-info --dir-file=/usr/share/info/dir /usr/share/info/libext2fs.info
makeinfo -o      doc/com_err.info ../lib/et/com_err.texinfo
install -v -m644 doc/com_err.info /usr/share/info
install-info --dir-file=/usr/share/info/dir /usr/share/info/com_err.info
sed 's/metadata_csum_seed,//' -i /etc/mke2fs.conf
cd ../..
rm -Rf e2fsprogs-1.47.0
tar -xvf sysklogd-1.5.1.tar.gz 
cd sysklogd-1.5.1
sed -i '/Error loading kernel symbols/{n;n;d}' ksym_mod.c
sed -i 's/union wait/int/' syslogd.c
make
make BINDIR=/sbin install
cat > /etc/syslog.conf << "EOF"
# Begin /etc/syslog.conf

auth,authpriv.* -/var/log/auth.log
*.*;auth,authpriv.none -/var/log/sys.log
daemon.* -/var/log/daemon.log
kern.* -/var/log/kern.log
mail.* -/var/log/mail.log
user.* -/var/log/user.log
*.emerg *

# End /etc/syslog.conf
EOF

cd ..
rm -Rf sysklogd-1.5.1
tar -xvf sysvinit-3.06.tar.xz 
cd sysvinit-3.06
patch -Np1 -i ../sysvinit-3.06-consolidated-1.patch
make
make install
cd ..
df -h
save_usrlib="$(cd /usr/lib; ls ld-linux*[^g])
             libc.so.6
             libthread_db.so.1
             libquadmath.so.0.0.0
             libstdc++.so.6.0.30
             libitm.so.1.0.0
             libatomic.so.1.2.0"
cd /usr/lib
for LIB in $save_usrlib; do     objcopy --only-keep-debug $LIB $LIB.dbg;     cp $LIB /tmp/$LIB;     strip --strip-unneeded /tmp/$LIB;     objcopy --add-gnu-debuglink=$LIB.dbg /tmp/$LIB;     install -vm755 /tmp/$LIB /usr/lib;     rm /tmp/$LIB; done
online_usrbin="bash find strip"
online_usrlib="libbfd-2.40.so
               libsframe.so.0.0.0
               libhistory.so.8.2
               libncursesw.so.6.4
               libm.so.6
               libreadline.so.8.2
               libz.so.1.2.13
               $(cd /usr/lib; find libnss*.so* -type f)"
for BIN in $online_usrbin; do     cp /usr/bin/$BIN /tmp/$BIN;     strip --strip-unneeded /tmp/$BIN;     install -vm755 /tmp/$BIN /usr/bin;     rm /tmp/$BIN; done
for LIB in $online_usrlib; do     cp /usr/lib/$LIB /tmp/$LIB;     strip --strip-unneeded /tmp/$LIB;     install -vm755 /tmp/$LIB /usr/lib;     rm /tmp/$LIB; done
for i in $(find /usr/lib -type f -name \*.so* ! -name \*dbg)          $(find /usr/lib -type f -name \*.a)                          $(find /usr/{bin,sbin,libexec} -type f); do     case "$online_usrbin $online_usrlib $save_usrlib" in         *$(basename $i)* )             ;;         * ) strip --strip-unneeded $i;             ;;     esac; done
unset BIN LIB save_usrlib online_usrbin online_usrlib
ls
ldconfig
cd /sources/
rm -rf /tmp/*
find /usr/lib /usr/libexec -name \*.la -delete
find /usr -depth -name $(uname -m)-lfs-linux-gnu\* | xargs rm -rf
userdel -r tester
tar -xvf lfs-bootscripts-20230101.tar.xz 
cd lfs-bootscripts-20230101
make install
cd ..
rm -Rf lfs-bootscripts-20230101
df -h
bash /usr/lib/udev/init-net-rules.sh
cat /etc/udev/rules.d/70-persistent-net.rules
ip link
ls /sys/class/net
cd /etc/sysconfig/
cat > ifconfig.eth0 << "EOF"
ONBOOT=yes
IFACE=eth0
SERVICE=ipv4-static
IP=192.168.1.2
GATEWAY=192.168.1.1
PREFIX=24
BROADCAST=192.168.1.255
EOF

mv ifconfig.eth0 ifconfig.enp0s3
vi ifconfig.enp0s3 
ip a
vi ifconfig.enp0s3 
cat ifconfig.enp0s3 
cat > /etc/resolv.conf << "EOF"
# Begin /etc/resolv.conf

domain <Your Domain Name>
nameserver <IP address of your primary nameserver>
nameserver <IP address of your secondary nameserver>

# End /etc/resolv.conf
EOF

vi /etc/resolv.conf 
echo "lfs113" > /etc/hostname
cat > /etc/hosts << "EOF"
# Begin /etc/hosts

127.0.0.1 localhost.localdomain localhost
127.0.1.1 <FQDN> <HOSTNAME>
<192.168.1.1> <FQDN> <HOSTNAME> [alias1] [alias2 ...]
::1       localhost ip6-localhost ip6-loopback
ff02::1   ip6-allnodes
ff02::2   ip6-allrouters

# End /etc/hosts
EOF

vi /etc/hosts 
cat > /etc/inittab << "EOF"
# Begin /etc/inittab

id:3:initdefault:

si::sysinit:/etc/rc.d/init.d/rc S

l0:0:wait:/etc/rc.d/init.d/rc 0
l1:S1:wait:/etc/rc.d/init.d/rc 1
l2:2:wait:/etc/rc.d/init.d/rc 2
l3:3:wait:/etc/rc.d/init.d/rc 3
l4:4:wait:/etc/rc.d/init.d/rc 4
l5:5:wait:/etc/rc.d/init.d/rc 5
l6:6:wait:/etc/rc.d/init.d/rc 6

ca:12345:ctrlaltdel:/sbin/shutdown -t1 -a -r now

su:S06:once:/sbin/sulogin
s1:1:respawn:/sbin/sulogin

1:2345:respawn:/sbin/agetty --noclear tty1 9600
2:2345:respawn:/sbin/agetty tty2 9600
3:2345:respawn:/sbin/agetty tty3 9600
4:2345:respawn:/sbin/agetty tty4 9600
5:2345:respawn:/sbin/agetty tty5 9600
6:2345:respawn:/sbin/agetty tty6 9600

# End /etc/inittab
EOF

cat > /etc/sysconfig/clock << "EOF"
# Begin /etc/sysconfig/clock

UTC=1

# Set this to any options you might need to give to hwclock,
# such as machine hardware clock type for Alphas.
CLOCKPARAMS=

# End /etc/sysconfig/clock
EOF

vi /etc/sysconfig/clock 
cat > /etc/sysconfig/console << "EOF"
# Begin /etc/sysconfig/console

KEYMAP="pl2"
FONT="lat2a-16 -m 8859-2"

# End /etc/sysconfig/console
EOF

vi /etc/sysconfig/console 
locale -a
LC_ALL=tr_TR.utf8 locale charmap
cat > /etc/profile << "EOF"
# Begin /etc/profile

export LANG=<ll>_<CC>.<charmap><@modifiers>

# End /etc/profile
EOF

vi /etc/profile
vi /etc/profile
cat > /etc/inputrc << "EOF"
# Begin /etc/inputrc
# Modified by Chris Lynn <roryo@roryo.dynup.net>

# Allow the command prompt to wrap to the next line
set horizontal-scroll-mode Off

# Enable 8-bit input
set meta-flag On
set input-meta On

# Turns off 8th bit stripping
set convert-meta Off

# Keep the 8th bit for display
set output-meta On

# none, visible or audible
set bell-style none

# All of the following map the escape sequence of the value
# contained in the 1st argument to the readline specific functions
"\eOd": backward-word
"\eOc": forward-word

# for linux console
"\e[1~": beginning-of-line
"\e[4~": end-of-line
"\e[5~": beginning-of-history
"\e[6~": end-of-history
"\e[3~": delete-char
"\e[2~": quoted-insert

# for xterm
"\eOH": beginning-of-line
"\eOF": end-of-line

# for Konsole
"\e[H": beginning-of-line
"\e[F": end-of-line

# End /etc/inputrc
EOF

cat > /etc/shells << "EOF"
# Begin /etc/shells

/bin/sh
/bin/bash

# End /etc/shells
EOF

vi /etc/fstab
cat > /etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type     options             dump  fsck
#                                                              order

/dev/<xxx>     /            <fff>    defaults            1     1
/dev/<yyy>     swap         swap     pri=1               0     0
proc           /proc        proc     nosuid,noexec,nodev 0     0
sysfs          /sys         sysfs    nosuid,noexec,nodev 0     0
devpts         /dev/pts     devpts   gid=5,mode=620      0     0
tmpfs          /run         tmpfs    defaults            0     0
devtmpfs       /dev         devtmpfs mode=0755,nosuid    0     0
tmpfs          /dev/shm     tmpfs    nosuid,nodev        0     0

# End /etc/fstab
EOF

vi /etc/fstab
vi /etc/fstab
cd /sources/
tar -xvf linux-6.1.11.tar.xz 
cd linux-6.1.11
make mrproper
make defconfig
make menuconfig
make menuconfig
make menuconfig
cat /etc/udev/rules.d/70-persistent-net.rules 
make menuconfig
make
make modules_install
mount
cp -iv arch/x86/boot/bzImage /boot/vmlinuz-6.1.11-lfs-11.3
cp -iv System.map /boot/System.map-6.1.11
cp -iv .config /boot/config-6.1.11
install -d /usr/share/doc/linux-6.1.11
cp -r Documentation/* /usr/share/doc/linux-6.1.11
chown -R 0:0 ../linux-6.1.11
grub-install /dev/sda
cat > /boot/grub/grub.cfg << "EOF"
# Begin /boot/grub/grub.cfg
set default=0
set timeout=5

insmod ext2
set root=(hd0,2)

menuentry "GNU/Linux, Linux 6.1.11-lfs-11.3" {
        linux   /boot/vmlinuz-6.1.11-lfs-11.3 root=/dev/sda2 ro
}
EOF

vi /boot/grub/grub.cfg
fdisk -l
vi /boot/grub/grub.cfg
cat /boot/grub/grub.cfg 
echo 11.3 > /etc/lfs-release
cat > /etc/lsb-release << "EOF"
DISTRIB_ID="Linux From Scratch"
DISTRIB_RELEASE="11.3"
DISTRIB_CODENAME="<your name here>"
DISTRIB_DESCRIPTION="Linux From Scratch"
EOF

cat > /etc/os-release << "EOF"
NAME="Linux From Scratch"
VERSION="11.3"
ID=lfs
PRETTY_NAME="Linux From Scratch 11.3"
VERSION_CODENAME="<your name here>"
EOF

vi /etc/lsb-release
vi /etc/os-release
logout
'p a
