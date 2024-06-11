# KDE/Plasma Configuration
#- <https://nixos.wiki/wiki/KDE>
{pkgs, ...}: {
  services.xserver = {
    enable = true;

    displayManager = {
      # Launch KDE in Wayland session
      defaultSession = "plasma";
      # Launch SDDM in Wayland
      sddm.wayland.enable = true;
    };

    /*
    displayManager = {
      sddm.enable = true;
      # plasma5.enable = true;
      plasma6.enable = true;
    };
    */
  };

  services.displayManager = {
    sddm.enable = true;
    plasma6.enable = true;
  };

  # Excluding unwanted packages
  environment.plasma6.excludePackages = with pkgs.kdePackages; [
    print-manager
  ];

  /*
  services.xserver.desktopManager.plasma5.excludePackages = with pkgs.libsForQt5; [
    print-manager
  ];
  */
}
