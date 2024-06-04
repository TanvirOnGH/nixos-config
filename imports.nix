# NixOS Configuration File Imports
{
  # N.B. : Paths in nix expressions are always relative the file which defines them
  imports = [
    # System
    ./system/no-defaults.nix
    ./system/nix/tweaks.nix
    ./system/hardware.nix
    ./system/filesystem.nix
    ./system/kernel.nix
    ./system/virtualization.nix
    ./system/bootloader.nix
    ./system/localization.nix
    ./system/udev-rules.nix
    ./system/power-management.nix
    ./system/nix/garbage-collection.nix
    ./system/nix/cache.nix
    # ./system/nix/flox.nix

    # Security
    # ./security/selinux.nix
    # ./security/auditd.nix
    ./security/firewall.nix
    ./security/antivirus.nix

    # Containers
    ./containers/flaresolverr.nix
    # ./containers/element-web.nix

    # Graphics
    ./hardware/gpu/nvidia.nix
    ./desktop/gui/opengl.nix

    # Networking
    ./hardware/network/internet.nix
    ./hardware/network/bluetooth.nix
    ./hardware/network/hotspot.nix

    # Sound
    ./desktop/media/pipewire.nix

    # GUI
    ./desktop/gui/server/xorg.nix
    ./desktop/gui/wm/awesome.nix

    # desktop/customization
    ./desktop/customization/plymouth.nix
    ./desktop/customization/font.nix
    ./desktop/customization/xdg.nix
    ./desktop/customization/gtk.nix
    ./desktop/customization/qt.nix

    # Hardware Misc
    # ./hardware/peripherals/argb.nix
    # ./hardware/peripherals/tablet.nix

    # Packages/Programs/Services
    ./users/root/settings.nix
    ./users/root/admin.nix
    ./users/root/packages.nix
    ./users/root/programs.nix
    ./users/root/services.nix
    ./users/root/flatpak.nix
    ./users/user/settings.nix
    ./users/user/home-manager.nix

    # Overlays
    ./overlays/discord.nix
    ./overlays/mpv.nix
    # ./overlays/electron.nix
  ];
}
