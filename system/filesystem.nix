# Filesystem Configuration
#- <https://nixos.wiki/wiki/Btrfs>
{
  lib,
  modulesPath,
  ...
}: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot = {
    initrd.availableKernelModules = [
      "aesni_intel"
      "cryptd" # Make encrypted boot quick. Ref: <https://nixos.wiki/wiki/Full_Disk_Encryption#Perf_test>
      "xhci_pci"
      "ahci"
      "nvme"
      "usb_storage"
      "usbhid"
      "sd_mod"
      "btrfs"
      "vfat"
      "zstd"
    ];
    # <https://nixos.wiki/wiki/NTFS>
    supportedFilesystems = ["ntfs" "btrfs" "ext4" "exfat" "tmpfs"];
  };

  # Swap
  #- <https://nixos.wiki/wiki/Btrfs#Swap_file>
  swapDevices = lib.mkForce [];

  # TMPFS
  boot.tmp = {
    useTmpfs = false;
    tmpfsSize = "80%";
  };

  boot.initrd.luks.devices."root".device = "/dev/disk/by-uuid/f3a68ed2-3797-4f89-98fb-b0aafa68d10e";

  /*
  The zstd compression level used in Btrfs is 3, which provides a good balance between compression ratio and compression speed.
  */
  fileSystems = {
    #- List btfs subvolumes: `<su> btrfs subvolume list /`
    "/" = {
      device = "/dev/disk/by-uuid/81116cb4-fa53-4257-ab91-bba86517e162";
      fsType = "btrfs";
      options = ["subvol=root" "compress=zstd:6"];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/81116cb4-fa53-4257-ab91-bba86517e162";
      fsType = "btrfs";
      options = ["subvol=home" "compress=zstd:6"];
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/81116cb4-fa53-4257-ab91-bba86517e162";
      fsType = "btrfs";
      /*
      Since the /nix mount point is used for the Nix package manager and stores the installed packages,
      it's likely that many of the files on this filesystem are read frequently.

      By setting the noatime option, the kernel no longer updates the atime attribute when a file is read,
      which can reduce the number of disk writes and improve performance, especially for read-heavy workloads.

      Therefore, setting noatime for this mount point can help reduce unnecessary
      disk writes and improve performance.
      */
      options = ["subvol=nix" "compress=zstd:6" "noatime"];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/22F4-8F3F";
      fsType = "vfat";
    };

    "/mnt/HDD" = {
      device = "/dev/disk/by-uuid/e55cdfed-5ef8-4660-a092-389c38d0f2cf";
      fsType = "btrfs";
      options = ["compress=zstd:4"];
    };

    # Windows Partition
    "/mnt/SSD" = {
      device = "/dev/disk/by-uuid/42E00DD7E00DD1D9";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1001"];
    };
  };
}
