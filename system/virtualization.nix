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

    # <https://nixos.wiki/wiki/Docker>
    docker = {
      enable = true;
      storageDriver = "btrfs";
    };
  };
}
