# Filesystem Configuration
#- <https://wiki.nixos.org/wiki/Btrfs>
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
      # "aesni_intel"
      # "cryptd" # Make encrypted boot quick. Ref: <https://wiki.nixos.org/wiki/Full_Disk_Encryption#Perf_test>
      "xhci_pci"
      "ahci"
      "usbhid"
      "sd_mod"
    ];

    kernelModules = ["kvm-amd"];

    supportedFilesystems = [
      "btrfs" #- <https://wiki.nixos.org/wiki/Btrfs>
      "ext4"
      "exfat"
      "tmpfs"
      "ntfs" #- <https://wiki.nixos.org/wiki/NTFS>
      # "bcachefs" #- <https://wiki.nixos.org/wiki/Bcachefs>
      # "zfs" #- <https://wiki.nixos.org/wiki/ZFS>
    ];
  };

  # Swap
  #- <https://wiki.nixos.org/wiki/Btrfs#Swap_file>
  swapDevices = lib.mkForce []; # Disable swap devices

  # TMPFS
  # for /tmp
  boot.tmp = {
    useTmpfs = false;
    tmpfsSize = "80%";
  };

  /*
  boot.initrd.luks.devices = {
    root = {
      device = "/dev/disk/by-uuid/0d63094a-cff7-473d-bec7-6da624473feb";
      preLVM = true;
    };
  };
  */

  fileSystems = {
    #- List btfs subvolumes: `<su> btrfs subvolume list /`
    "/" = {
      device = "/dev/disk/by-uuid/2d9be16a-ddf3-43fc-8fd6-85d53984c447";
      fsType = "btrfs";
      options = ["subvol=root" "compress=zstd:8" "noatime" "nodiratime" "ssd_spread" "discard=async" "space_cache=v2"];
      neededForBoot = true;
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/FEB0-B2ED";
      fsType = "vfat";
    };

    "/nix" = {
      device = "/dev/disk/by-uuid/2d9be16a-ddf3-43fc-8fd6-85d53984c447";
      fsType = "btrfs";
      /*
      Since the /nix mount point is used for the Nix package manager and stores the installed packages,
      it's likely that many of the files on this filesystem are read frequently.

      By setting the noatime option, the kernel no longer updates the atime attribute when a file is read,
      which can reduce the number of disk writes and improve performance, especially for read-heavy workloads.

      Therefore, setting noatime for this mount point can help reduce unnecessary
      disk writes and improve performance.
      */
      options = ["subvol=nix" "compress=zstd:8" "noatime" "nodiratime" "ssd_spread" "discard=async" "space_cache=v2"];
      neededForBoot = true;
    };

    "/home" = {
      device = "/dev/disk/by-uuid/2d9be16a-ddf3-43fc-8fd6-85d53984c447";
      fsType = "btrfs";
      options = ["subvol=home" "compress=zstd:8" "noatime" "nodiratime" "ssd_spread" "discard=async" "space_cache=v2"];
    };

    # HDDs
    /*
    "/mnt/hdd" = {
      device = "/dev/disk/by-uuid/e34ed687-5ee1-47cd-83cb-c56c8ec38780";
      fsType = "btrfs";
      options = ["compress=zstd:3" "noatime" "nodiratime" "autodefrag" "space_cache=v2"];
    };

    "/mnt/hdd2" = {
      device = "/dev/disk/by-uuid/93c845a5-2abd-4c56-b8d1-7f37271e827b";
      fsType = "btrfs";
      options = ["compress=zstd:3" "noatime" "nodiratime" "autodefrag" "autodefrag" "space_cache=v2"];
    };

    "/mnt/hdd3" = {
      device = "/dev/disk/by-uuid/c1cf9ba8-18b8-49c2-89fe-8aacabfad79f";
      fsType = "btrfs";
      options = ["compress=zstd:3" "noatime" "nodiratime" "autodefrag" "space_cache=v2"];
    };
    */

    /*
    "/mnt/ssd" = {
      device = "/dev/disk/by-uuid/b335a65f-1c9d-4a15-a577-d0863c829ff0";
      fsType = "btrfs";
      options = ["compress=zstd:4" "noatime" "nodiratime" "ssd_spread" "discard=async" "space_cache=v2"];
    };
    */

    # Game Drives
    # ntfs drives - Requires fast boot to be disabled in Windows for write support
    "/mnt/gamedrive1" = {
      device = "/dev/disk/by-uuid/04D776A71DBD8FFB";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"];
    };

    "/mnt/gamedrive2" = {
      device = "/dev/disk/by-uuid/600C58C806C9E3C7";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"];
    };

    "/mnt/gamedrive3" = {
      device = "/dev/disk/by-uuid/0E048B027BECE584";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"];
    };

    # <https://wiki.nixos.org/wiki/NTFS>
    # Windows Partition
    "/mnt/windows" = {
      device = "/dev/disk/by-uuid/824234F14234EB93";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"]; # Requires fast boot to be disabled in Windows for write support
    };
  };
}
