# Virtualization Configuration
{...}: {
  # <https://nixos.wiki/wiki/Virt-manager>
  virtualisation = {
    libvirtd.enable = true;
    #- Xen currently does not support EFI boot
    # xen.enable = true;

    # <https://nixos.wiki/wiki/VirtualBox>
    /*
    virtualbox.host.enable = true;
    virtualbox.host.enableExtensionPack = true;
    */

    # <https://nixos.wiki/wiki/WayDroid>
    # Wayland Only
    # Running on X11 (use weston package in X11 session): <https://github.com/waydroid/waydroid/issues/195#issuecomment-953926526>
    waydroid.enable = false;

    # <https://nixos.wiki/wiki/Docker>
    docker = {
      enable = true;
      enableNvidia = true;
      storageDriver = "btrfs";
    };
  };
}
