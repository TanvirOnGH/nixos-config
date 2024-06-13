# Home Manager User's Services Configuration
_: let
  home-manager = builtins.fetchTarball "https://github.com/nix-community/home-manager/archive/master.tar.gz";
in {
  imports = [
    (import "${home-manager}/nixos")
  ];

  home-manager.users.user = _: {
    services = {
      kdeconnect.enable = true;
      gnome-keyring.enable = true;

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
