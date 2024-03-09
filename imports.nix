# NixOS Configuration File Imports
{
  # N.B. : Paths in nix expressions are always relative the file which defines them
  imports = [
    # System
    ./system/nix/tweaks.nix
    ./system/hardware.nix
    ./system/filesystem.nix
    ./system/kernel.nix
    ./system/virtualization.nix
    ./system/bootloader.nix
    ./system/localization.nix
    ./system/admin.nix
    ./system/udev-rules.nix
    ./system/power-management.nix
    ./system/nix/garbage-collection.nix
    ./system/nix/cache.nix
    ./system/nix/flox.nix

    # Graphics
    ./hardware/gpu/nvidia.nix
    ./desktop/gui/opengl.nix

    # Networking
    ./hardware/network/internet.nix
    ./hardware/network/bluetooth.nix
    ./hardware/network/hotspot.nix
    ./hardware/network/firewall.nix

    # Sound
    ./desktop/media/pipewire.nix

    # GUI
    ./desktop/gui/server/xorg.nix
    ./desktop/gui/wm/awesome.nix

    # desktop/customization
    # ./desktop/customization/plymouth.nix
    ./desktop/customization/font.nix
    ./desktop/customization/xdg.nix
    ./desktop/customization/gtk.nix
    ./desktop/customization/qt.nix

    # Packages/Programs/Services
    ./users/root/settings.nix
    ./users/root/packages.nix
    ./users/root/programs.nix
    ./users/root/services.nix
    ./users/root/flatpak.nix
    ./users/user/settings.nix
    ./users/user/home-manager.nix

    # Overlays
    # ./overlays/discord.nix
    # ./overlays/electron.nix
  ];
}
