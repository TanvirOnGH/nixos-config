# Virtualization Configuration
{pkgs, ...}: {
  # <https://nixos.wiki/wiki/Virt-manager>
  # <https://nixos.wiki/wiki/Libvirt>
  virtualisation = {
    libvirtd = {
      enable = true;
      qemu.ovmf.enable = true;
    };

    #- Xen currently does not support EFI boot
    # xen.enable = true;

    # <https://nixos.wiki/wiki/VirtualBox>
    virtualbox = {
      guest.clipboard = true;

      host = {
        enable = false;
        # Note: Needs a lot of compilation
        enableExtensionPack = true;
      };
    };

    # <https://nixos.wiki/wiki/WayDroid>
    # Wayland Only
    # Running on X11 (use weston package in X11 session): <https://github.com/waydroid/waydroid/issues/195#issuecomment-953926526>
    waydroid.enable = false;

    # <https://nixos.wiki/wiki/Docker>
    docker = {
      enable = true;
      enableNvidia = true;
      storageDriver = "btrfs";

      # Extra packages to add to PATH for the docker daemon process
      extraPackages = with pkgs; [
        docker-compose # plugin: Docker CLI plugin to define and run multi-container applications with Docker
      ];

      autoPrune = {
        enable = false;
        dates = "weekly";
      };
    };

    podman = {
      enable = false;
      enableNvidia = true;

      # Extra packages to be installed in the Podman wrapper
      extraPackages = with pkgs; [
        podman-compose
        gvisor
      ];

      autoPrune = {
        enable = false;
        dates = "weekly";
      };

      dockerSocket.enable = false;
      dockerCompat = false;
    };
  };

  # <https://github.com/kholia/OSX-KVM>
  # Required by AMD boxes for OSX-KVM
  boot.extraModprobeConfig = ''
    options kvm_amd nested=1
    options kvm ignore_msrs=1 report_ignored_msrs=0
  '';
}
