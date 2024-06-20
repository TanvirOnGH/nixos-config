# Home Manager User's Services Configuration
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = _: {
    services = {
      kdeconnect.enable = false;
      gnome-keyring.enable = true;

      # network-manager-applet.enable = true;

      # PulseAudio System Tray
      # Replacement for the deprecated padevchooser
      # pasystray.enable = true;

      # Compositor (X11)
      # home-manager fails
      # keep it disabled temporarily
      # TODO: investigate
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
