#!/bin/sh

# Linux
#KERNEL="test/vmlinuz"
#INITRD="test/initrd.gz"
#CMDLINE="earlyprintk=serial console=ttyS0 acpi=off"

# FreeBSD
USERBOOT="test/userboot.so"
BOOTVOLUME="FreeBSD-10.1-RELEASE-amd64.raw"
KERNELENV=""

MEM="-m 1G"
#SMP="-c 2"
#NET="-s 2:0,virtio-net"
#IMG_CD="-s 3,ahci-cd,/somepath/somefile.iso"
IMG_HDD="-s 4,virtio-blk,FreeBSD-10.1-RELEASE-amd64.raw"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
LPC_DEV="-l com1,stdio"
#UUID="-U deadbeef-dead-dead-dead-deaddeafbeef"

# Linux
#build/xhyve $MEM $SMP $PCI_DEV $LPC_DEV $NET $IMG_CD $IMG_HDD $UUID -f kexec,$KERNEL,$INITRD,"$CMDLINE"

# FreeBSD
build/xhyve -A $MEM $SMP $PCI_DEV $LPC_DEV $NET $IMG_CD $IMG_HDD $UUID -f fbsd,$USERBOOT,$BOOTVOLUME,"$KERNELENV"
