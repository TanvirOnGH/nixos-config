# KDE/Plasma Configuration
#- <https://nixos.wiki/wiki/KDE>
{pkgs, ...}: {
  services.xserver = {
    enable = true;
    displayManager = {
      sddm.enable = true;
      plasma5.enable = true;
    };
  };

  # Excluding unwanted packages
  services.xserver.desktopManager.plasma5.excludePackages = with pkgs.libsForQt5; [
    print-manager
  ];
}
