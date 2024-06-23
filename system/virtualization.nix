# Virtualization Configuration
{pkgs, ...}: {
  # <https://nixos.wiki/wiki/Virt-manager>
  # <https://nixos.wiki/wiki/Libvirt>
  virtualisation = {
    spiceUSBRedirection.enable = true;

    libvirtd = {
      enable = true;
      qemu = {
        ovmf = {
          enable = true;
          packages = [pkgs.OVMFFull.fd];
        };

        swtpm = {
          enable = true;
          package = pkgs.swtpm;
        };
      };
    };

    #- Xen currently does not support EFI boot
    # xen.enable = true;

    # <https://nixos.wiki/wiki/VirtualBox>
    virtualbox = {
      guest.clipboard = true;

      host = {
        enable = false;
        # Note: Needs a lot of compilation
        # Oracle Extension Pack can be manually downloaded:
        # nix-prefetch-url https://download.virtualbox.org/virtualbox/7.0.18/Oracle_VM_VirtualBox_Extension_Pack-7.0.18-162988.vbox-extpack
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

      # Deprecated, use hardware.nvidia-container-toolkit.enable instead
      enableNvidia = false;
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

      # Deprecated, use hardware.nvidia-container-toolkit.enable instead
      enableNvidia = false;

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
