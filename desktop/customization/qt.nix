# QT Configuration
#- <https://nixos.wiki/wiki/Qt>
{...}: {
  # Make qt themes look similar to gtk ones
  qt = {
    enable = true;
    platformTheme = "gtk2";
    style = "gtk2";
  };

  # Enable HiDPI scaling in QT applications
  services.xserver.desktopManager.plasma5.useQtScaling = false;
}
