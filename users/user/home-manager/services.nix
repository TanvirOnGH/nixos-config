# Home Manager User's Services Configuration
{pkgs, ...}: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = _: {
    services = {
      kdeconnect.enable = false;
      gnome-keyring.enable = true;

      xsettingsd = {
        enable = true;
        settings = {
          # Font
          "Xft/Antialias" = 1;
          "Xft/Hinting" = 1;
          "Xft/HintStyle" = "hintmedium";
          "Xft/RGBA" = "rgb";

          # Theme
          "Net/ThemeName" = "Equilux";
          "Net/IconThemeName" = "Tela-black-dark";
          "Gtk/CursorThemeName" = "Bibata-Original-Classic";

          # Misc
          "Net/CursorBlink" = 1;
        };
      };

      screen-locker = {
        enable = true;
        xautolock.enable = true;
        inactiveInterval = 10;
        lockCmd = "${pkgs.i3lock-fancy-rapid}/bin/i3lock-fancy-rapid 5 5";
      };

      # TODO: Setup activitywatch
      # <https://activitywatch.net/>
      activitywatch.enable = false;

      # network-manager-applet.enable = true;

      # PulseAudio System Tray
      # Replacement for the deprecated padevchooser
      # pasystray.enable = true;

      # Compositor (X11)
      # picom.enable = false;

      # Clipboard Manager
      # copyq.enable = true;

      udiskie = {
        enable = true; # requires services.udisks2.enable = true
        automount = true;
        notify = true;
        tray = "never";
      };

      gpg-agent = {
        enable = true;
        enableSshSupport = true;
      };
    };
  };
}
