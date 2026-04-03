#!/usr/bin/env bash

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <vm name>"
  exit 1
fi

qemu-system-x86_64 \
    -enable-kvm \
    -M q35 \
    -smp 6 \
    -m 12G \
    -cpu host \
    -net nic,model=virtio \
    -net user,hostfwd=tcp::2222-:22 \
    -device virtio-sound-pci,audiodev=my_audiodev -audiodev pipewire,id=my_audiodev \
    -device virtio-vga-gl,hostmem=4G,blob=true,venus=true \
    -vga none \
    -display gtk,gl=on,show-cursor=on \
    -usb -device usb-tablet \
    -object memory-backend-memfd,id=mem1,size=12G \
    -machine memory-backend=mem1 \
    -drive if=pflash,format=raw,readonly=on,file=/usr/share/edk2/x64/OVMF_CODE.secboot.4m.fd \
    -drive if=pflash,format=raw,file=/home/gaugusto/.config/libvirt/qemu/nvram/$1_VARS.fd \
    -drive file=/home/gaugusto/.local/share/libvirt/images/$1.qcow2
