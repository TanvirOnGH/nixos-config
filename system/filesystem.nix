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
      # "aesni_intel"
      # "cryptd" # Make encrypted boot quick. Ref: <https://nixos.wiki/wiki/Full_Disk_Encryption#Perf_test>
      "xhci_pci"
      "ahci"
      "nvme"
      "usbhid"
      "sd_mod"
      "btrfs"
      "vfat"
      "zstd"
    ];

    kernelModules = ["kvm-amd"];

    supportedFilesystems = ["btrfs" "ext4" "exfat" "tmpfs" "ntfs"];
  };

  # Swap
  #- <https://nixos.wiki/wiki/Btrfs#Swap_file>
  swapDevices = lib.mkForce [];

  # TMPFS
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
  /*

  /*
  The zstd compression level used in Btrfs is 3, which provides a good balance between compression ratio and compression speed.
  */
  fileSystems = {
    #- List btfs subvolumes: `<su> btrfs subvolume list /`
    "/" = {
      device = "/dev/disk/by-uuid/2d9be16a-ddf3-43fc-8fd6-85d53984c447";
      fsType = "btrfs";
      options = ["subvol=root" "compress=zstd:5"];
    };

    "/home" = {
      device = "/dev/disk/by-uuid/2d9be16a-ddf3-43fc-8fd6-85d53984c447";
      fsType = "btrfs";
      options = ["subvol=home" "compress=zstd:5"];
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
      options = ["subvol=nix" "compress=zstd:5" "noatime"];
    };

    "/boot" = {
      device = "/dev/disk/by-uuid/FEB0-B2ED";
      fsType = "vfat";
    };

    "/mnt/hdd" = {
      device = "/dev/disk/by-uuid/e34ed687-5ee1-47cd-83cb-c56c8ec38780";
      fsType = "btrfs";
      options = ["compress=zstd:3"];
    };

    /*
    "/mnt/ssd" = {
      device = "/dev/disk/by-uuid/7c88decb-6888-4cd4-984f-452ad5dc4abe";
      fsType = "btrfs";
      options = ["compress=zstd:4"];
    };
    */

    # <https://nixos.wiki/wiki/NTFS>
    "/mnt/windows" = {
      device = "/dev/disk/by-uuid/58CC8F20CC8EF790";
      fsType = "ntfs-3g";
      options = ["rw" "uid=1000"]; # Requires fast boot to be disabled in Windows for write support
    };
  };
}
