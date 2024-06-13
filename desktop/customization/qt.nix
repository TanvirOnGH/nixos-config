# QT Configuration
#- <https://nixos.wiki/wiki/Qt>
_: {
  # Configure QT themes to resemble GTK themes
  qt = {
    enable = true;
    platformTheme = "gtk2";
    style = "gtk2";
  };

  # Disable QT scaling in Plasma 5 to avoid conflicts with system-wide HiDPI settings
  services.xserver.desktopManager.plasma5.useQtScaling = false;
}
